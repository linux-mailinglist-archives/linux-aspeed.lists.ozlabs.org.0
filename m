Return-Path: <linux-aspeed+bounces-4284-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id abvSCpscO2p5QwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4284-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 01:54:03 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65A6BAA05
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 01:54:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=bmX4NeWj;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4284-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4284-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glMNS1k9hz2yY1;
	Wed, 24 Jun 2026 09:54:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782225002;
	cv=none; b=STdcNYtyjpKuerA8/IwHALiZWhK3HEliYfyqHhpkX3yn8RyP466ULFNIuAxqw3b36BISEaFglrXGcZVhPq4C1J+HehgUCrUUPWmiLteOfo9r3UmAUSHMLEN511PB3/sEMT1XrOP3nZUjjaNhQaNIA/thRNq1PuULKlCsqsbUivhRYJCNmXQXQKi0FhKdYv2elWAVaN08pK2tngTp7TU5NrkiMhqS/4ONnpIyHQhrxswTPSDf+hjVUQ9LI0B1bgF7Xpt9flmClLX9YEEzHhytIXRwW0D/9kQcAk2+qRdigdMtX4huAtDnFraOKLXi0pfx8NT3D8NKa+aM6wU8W/5dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782225002; c=relaxed/relaxed;
	bh=w0YQhBtC/ubH1Q0Mrdh/TGxhsAQ0oS6iny3Z+QMvfNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KjoU9H6+/6aAiY3TvOaN/fL1iQp5SkKOMWjQXuFFU5r5FZt0Fw6Iy0wS1OP+h10oQlNgth3ZWGY92aym731Y3EJJNrMz9PVNYt2Cm/R2b05RXDSH3hsysKv6w7pZA2bIAsv1cZIdPfsRDwj0kIFyjlCoOE3W/xjKtlPspumQi7cGzvGYZNc5GYVoZOF3aT+25LQu6eLaSxolnVk0CXBIEf/lGerZhM8jmksZrLtl7bH1ZxBzfpgj16vOPgi0NnEBX+w/rOEEgY3ZGF2P5ivrooO52jk6q8RWSBghD+jyI+lP5QBZUSwUKiDz8F7kEiFEfNGdRYGQHbMqf3XvE7h8zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=bmX4NeWj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=gregoire.layet@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gl6sj5FrGz2xM7
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 00:30:01 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49230a567a9so27850375e9.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jun 2026 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224999; x=1782829799; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0YQhBtC/ubH1Q0Mrdh/TGxhsAQ0oS6iny3Z+QMvfNE=;
        b=bmX4NeWjGgcoTe5Qtmx8UL08lUbFZdHKO8jRB3lHd/fD6T5WLBuAPORsbeVOoCz8sq
         uHUnuvGuZKNVMeX42HYklB50wzeGiaQSl3rFFWGscifWWXkpoPuiQ2J2ESYBVDeOMyVn
         f7hAL/nq1pMxBX/FSKoE+0RN/5HXBBbAL2H/oeer5KoAxtLRbCZyDlFCm5s7LScwy0G3
         1MhF58bRisazMyoiO4Zb0K6pqrVOV3Rwk2SHn2b99duvSHS9az3EZ4bE2IIsw7kSNAxQ
         yvYzZzZUIeFrfWc5jN9ORq2O366iOL7k4XqXh8rHbcWX2iOvkKKpBHijN9tLTBunE4S4
         m9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224999; x=1782829799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w0YQhBtC/ubH1Q0Mrdh/TGxhsAQ0oS6iny3Z+QMvfNE=;
        b=EDKL7L+9dInqla02tiE3aNt5ReUg++2of7Nrta2FYedZM0lmQ/17R/6Vh5HBV9+Y6d
         OwBbUqfOdNOvs1fLVMw/3vemMYJuM+kqqRKhgoDax3qptibvPcJcK2FWiS/MzwKNLePI
         oQ0l3B956etm3MtxrxxwD+8ty1WptsDhiDlIemHl8eE2gofCP/hDuzemhrIQNxbhJHsT
         cU1nJ6tEyMRCioLfEY+JZwFJ20arAGqZNO2nTjmuMvUrPI5x7HWdcfs5JcbLhklIhUHt
         5MHJ31/UEeJXY+sfZbXLHRUJgza511qADn11FLxwVSgRB1E8xg6ht24evHbX/KXGftgC
         ccmA==
X-Forwarded-Encrypted: i=1; AFNElJ/V+ifyjkA8UnAV4uJ7Jx0ElGRVU96GjQSqFE34oW/OjkzinXxyUoGNwl4yyvfZxF9QI0yYdUOD/d7VyTo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEtMPlEBJyXpeKwz8e/n9lPDr1mI93Qs2aghQQNH++hv0TJ4yE
	UYQUZrkm+7y6zrTp9LdAsUKNjJXDKYId7BIclvWhwG7e6XaIrZyc8cAcICMPsmC9Ehs=
X-Gm-Gg: AfdE7clgUB14azSctkQAO30LkK2YTRTiAv3UlZ3vyrMZf72/U7DSpJF8g37EYPbV9BE
	IFf8mgJ30PeirhbIHs/aVYlvuRxbbw3AyQN2uRwH6562mRyvRpzgeOIB1cBPRaYQiwkfIzdq4O9
	+WJtjvDtFivQBp45hZP4Di3ciIDysWrIa/8Hq3ct3hZ66i0Gk62kE1xQwzww3eSisjW72Ls+3Eb
	RGF/fSobSX51Nf32gxyU1TyEOPFRLwVXHDbu8d7susKNUE0k2NVF2WCloSwBWf6RNXTZV3h1AKa
	gxEuN5GFZ3NkJL2rjy3vwLrby1k8IuAotrU8oO5JrZNSLFMe18GoI6NYPI42f/eFMOHukauo2Aw
	yAIFu9syStNHxGWo82XSq2jj3xpoE9o/uoVd1y54nQpkRc+24OzQcx59jmPkJhyPnFpDKHk8nqD
	k/uge4FVXejGert+3me6cTd0z6ZzBmrgz4GAF2/onxaB61whFh0VukjACpfQDYoYTfeVn7N/Brl
	qnAK0I4KuOlCy6/1XjVbWa8D60L
X-Received: by 2002:a05:600c:4886:b0:490:d354:d15b with SMTP id 5b1f17b1804b1-49240e9545amr189390855e9.29.1782224998752;
        Tue, 23 Jun 2026 07:29:58 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:58 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
Date: Tue, 23 Jun 2026 14:25:44 +0000
Message-ID: <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4284-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:gregoire.layet@9elements.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,9elements.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,9elements.com:dkim,9elements.com:email,9elements.com:mid,9elements.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B65A6BAA05

Use the ast2600 compatible string.
This makes it more precise and enables specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..7c02633f2bd6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.54.0


