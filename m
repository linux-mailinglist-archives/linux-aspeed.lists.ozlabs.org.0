Return-Path: <linux-aspeed+bounces-4330-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jbe7DxupRWpIDgsAu9opvQ
	(envelope-from <linux-aspeed+bounces-4330-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 02 Jul 2026 01:56:11 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F736F280C
	for <lists+linux-aspeed@lfdr.de>; Thu, 02 Jul 2026 01:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rQUM9I+t;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4330-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4330-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4grH396424z2xqn;
	Thu, 02 Jul 2026 09:56:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782926120;
	cv=none; b=VIsWL9lbB5z0HxahIBo02N6xRBdGyBTcUpArybDnX5poPZv/uc+TdM/a3h8bFXLeJcHsYmlx0C+TIhcG2oYykR0/fks2O3TKI8p7fVuUHeVadcELni8bROjTw3eA7CUYn+A4GVThh0MXlD6ZYX72HWNQzBUhy1ZY2bjulQVt9og6IIBflPR3c2BOl4XQUYdrTCGPYAIrVSPa7by5fGY17lpkb9SfVoDbAbak4iqvzfbXsg1lQUlALlexWSYKkAn/dvkic4zKZrnTqAK8n7db7x3EI5Ag3xnWEPE7Rqz9+55RReqzgH9wPNBYCVA6kNbKdM6mes4IRfzalPgXvoiAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782926120; c=relaxed/relaxed;
	bh=r5j8jAU52xCxPnc3K4cdDtHFT9hkocfdMqu7pwNKuyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZTZjBMihoCLi60+a7SXyblyeymJ67e7zxmiqUALkkNh+wb8dycq2ug5qQ9GjwmjaNaEgWH4ltIXozieT3SzSbgmhrknQ8F/Y8ZaF4LeFNGsEm3ffAWi2qdOJOQBeXjqs2axtvinJuC5zyhncvgSTyGR2Mv1HQiG4B2BGSQBDJVx+NRe10qj82Jkhg6Ube4gau/UOv6CAAGscaZGb/f6so1ihhnERW0qoleAgHn9djKX/ZPUbKoOX/TD5dGpuHzkBXOdY6NDX4Nt5/R079RXYS/Y8e/9xzIU0FN/l+7Ve9wxb26/Dlj8ysj+kkLZJV5RfPANXiGFjrzkslV0vMSKgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rQUM9I+t; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=karthiproffesional@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gr68k5SLQz2yfN
	for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Jul 2026 03:15:18 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c96c92c0980so363293a12.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Jul 2026 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782926115; x=1783530915; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5j8jAU52xCxPnc3K4cdDtHFT9hkocfdMqu7pwNKuyc=;
        b=rQUM9I+tBMb0hWcEVIBLR+IomSsfI6GdN+jwd1mMfDUedWQUBcE4UBsozd7myUbTgX
         QDxSg61Fky7C5E9SR6QHRiwAc8YVqL10h3Yv048RaMPoHSZoCA5TSrd0PmOYS5lI4arv
         /S10y9oYw1U6SpEdXqgsmqyL2FKKl84hHxMSCma+Mlco5motCLGVVdarF+oVpcZl8CvL
         JJ3BsSwbN5nVoMyjuI+rVyp+HAecLhgp9Gmp5TA2iHtmS9KEoC0fyOvJ24rRefgAiU7V
         k4pfuCKjcIsTVgk30AV+CHIDi1Nb7RtyzKmh8H1BN1WJSognQymRHjQFHVuxnA/D56TQ
         DKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782926115; x=1783530915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5j8jAU52xCxPnc3K4cdDtHFT9hkocfdMqu7pwNKuyc=;
        b=NISQxuaPSghvdoN58sQR254xmL9YIgGKk+GOSAgbq8A6tq7Q3E7sNxNToAAL7ryA20
         Ml84vXBt+WixCewBL6O5O0IGsb5c8Z9WDwJ/DyAmp0c6XLT9Fc4ZZ5+xSvy2Z2j8K4h6
         DIS894nl6zKM284iKY0bdkdZsZ/LsAehcbbpymzB4o2KefsxCuPfEgekKFU+ZJaV42WD
         Bs8D7089NxoNztXcLOr+F0vnMOAN/u9oH7MO3pMbonUhsvlaaHUZ6cXNeMuHaV3SixEf
         PUTjcy78txfzvm/vmB5QRZr8/rl3wlEJA3HvH588nnpNDjL+daol4bTj7K9Fsa3jgHvm
         ZUgw==
X-Forwarded-Encrypted: i=1; AFNElJ/IztfmbTDeFlYRM9ev9W4BAmhLlPhSiHGF1kvKdw9lcBrg7DNvcrG0lOJ/glIj8KdW5pByZNjOEYFykR4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXCJ84+8ENUsbZq3rDIEqPPetWfsZnEa1cRo6hpC4fUie9JMo8
	QNvzbl6rCBoF4NVwhr8p/XV/5lTiBSCqufehLBQe7X5+M/s2Ohrp8ab1
X-Gm-Gg: AfdE7cmD3iB6L+Ka7V4tb1bmFksex29QW433WdTM74YO6+vkVUFvP8dTIbUQPSbcYLa
	kBIv0fHiDxRRy/EZ5l17ycNLLpNRemO9nu51uTKptkRvypoENTiNMDV0fUvrobIQT5jcjHl63fy
	xa6J7bJ//V19RXgO4pa1KYW5CWcZR4yx89VN/LMaBLVEbjnHxID1FuWl6VECS59A6jOqUokLkeO
	oeGc9zR6LRoBN3zrvvcEQl3wh1H21BGq4bhk/S+3R4ju64PzVYtL7J4mCnZkzNBsSn+hVY1O9I8
	tK9HVtXEmxwmeismpgK2x86IKsfZwmy7I5G/v4kUYsohId7XhzOXmAr8sYoyf898WZ5z0dZsKH4
	4W8Mz9XuPf5w7zSFJlt6AfQawPdBzNsstsFOhe5X9Hjud/rPYD+pdr5dcapnVstrPKBdBX0EYJG
	U+7qRMnQE0qVzhM52CS9hkGZL0awM+Hd33ueMvV5vwLUyAhetZj+IeeRo=
X-Received: by 2002:a05:6300:6702:b0:3bf:b49f:53fd with SMTP id adf61e73a8af0-3bff402b5a9mr1914162637.3.1782926115066;
        Wed, 01 Jul 2026 10:15:15 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.201.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300e4a7sm21777940eec.13.2026.07.01.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:15:14 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Wed,  1 Jul 2026 17:15:06 +0000
Message-ID: <20260701171506.338614-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4330-lists,linux-aspeed=lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:joel@jms.id.au,m:andrew@aj.id.au,m:kees@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[karthiproffesional@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthiproffesional@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75F736F280C

Hi Andrew,

Just following up, it's been about two weeks since I shared the
hardware validation results. I believe I've addressed the questions
raised in the thread, but please let me know if there's anything
else you'd like me to do.

Thanks,
Karthikeyan

