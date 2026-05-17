import 'package:flutter/material.dart';
import 'package:teraparent_mobile/app/data/models/terapist.dart';

class TherapistCard extends StatelessWidget {
  final Therapist therapist;

  const TherapistCard({
    super.key,
    required this.therapist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),

                    child: Image.network(
                      therapist.imageUrl,
                      width: 84,
                      height: 84,
                      fit: BoxFit.cover,

                      errorBuilder:
                          (_, __, ___) {
                        return Container(
                          width: 84,
                          height: 84,
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(0, 8),

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFFFEAA7,
                        ),

                        borderRadius:
                            BorderRadius.circular(
                          10,
                        ),

                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      ),

                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 12,
                          ),

                          const SizedBox(
                            width: 2,
                          ),

                          Text(
                            therapist.rating
                                .toString(),

                            style:
                                const TextStyle(
                              fontSize: 10,
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  Color(0xFF7F8C8D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      therapist.name,

                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Color(0xFF0F172A),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      therapist.role,

                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight:
                            FontWeight.w600,
                        color:
                            Color(0xFF2F6F57),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey[400],
                          size: 14,
                        ),

                        const SizedBox(width: 4),

                        Expanded(
                          child: Text(
                            therapist.location,

                            maxLines: 1,

                            overflow:
                                TextOverflow
                                    .ellipsis,

                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            therapist.description,

            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.4,
            ),

            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(
                      0xFF2E5A5A,
                    ),

                    foregroundColor:
                        Colors.white,

                    minimumSize:
                        const Size(
                      double.infinity,
                      48,
                    ),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius
                              .circular(14),
                    ),

                    elevation: 0,
                  ),

                  icon: const Icon(
                    Icons.calendar_today,
                    size: 16,
                  ),

                  label: const Text(
                    "Jadwalkan",

                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              InkWell(
                onTap: () {},

                borderRadius:
                    BorderRadius.circular(14),

                child: Container(
                  padding:
                      const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color:
                        const Color(0xFFE6F4F1),

                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),
                  ),

                  child: const Icon(
                    Icons.chat_bubble_outline,
                    color: Color(0xFF2E5A5A),
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}