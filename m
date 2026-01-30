Return-Path: <linux-aspeed+bounces-3446-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qiTtGpfWf2miyQIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3446-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sun, 01 Feb 2026 23:41:27 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151DC76C6
	for <lists+linux-aspeed@lfdr.de>; Sun, 01 Feb 2026 23:41:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f44V311G8z30Lv;
	Mon, 02 Feb 2026 09:41:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769761229;
	cv=none; b=DUT5DMB3f1+f+CIJHBcmv2kegrKpZPVnImIikJ1iy7YjKd9YTGiKFoU0PVKrHJ6dKDXTjDz9C5fcxdSR/nputQgBM8nd+9cW880bDqO50d+W3L2SMGkAQZA7UbhoGXF2YKvsFc75paPUvuCbjCnsK26CQFsDSNTLIn1IVdznfkczQqvHXNEvndNdNUv3PCvqLJjNWU2FhjrbO0xmSRCgoojRKvFlhe4VNKL5SMkAoQFEMhcofqo/S3kIklNEIudaYMXP9X+D77bAeHwkG0jqH7ZaoaoLiJeSR4wGXO+NStr2db4GyVAmKj+v9SdUPbYKslArqSxzhUTYaaAhVmWqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769761229; c=relaxed/relaxed;
	bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPgNYeBNtF6ZU/PxCZNhjEsCvlCMNg9QTYe+skyJEbYUHJFIREm4JNdkui/q3XC8jpzIWK+RnPtF5IEFz3qXpcjP8soxbhtM7rOWBblgQNVodNOmxtgYZYdxBf5BOTkDN2eec2DF5awkMdDO29xZ8BAlX4Q06U0ln8bp9JkZVOQwr3PsVtl9cKeAz2Tiaq67RNrNsomPR4Q+7s9irZiD/pdu8H7OO4lnP5MaYN809ls2dGkAGgPOjobpxWZb7/AsbEb3KS2D4L/nDOjpWyLdi+KeFDnIE5b+jU1z28mM/RthcDYApQIPHJ5ZcE9SJ/YP1dozZesOu8A8jpBPohnw7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J48FUf3D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J48FUf3D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2TTn0bFzz2xjP
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Jan 2026 19:20:29 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82307c6902eso913946b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Jan 2026 00:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761227; x=1770366027; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=;
        b=J48FUf3DARZ2YYZZZCAhVDk/ZcrFvQzWXKpT82F4t/KP1pOJT/eJQB/lNVPNKEjGxx
         HSlsMMeobfggQ40PHlcGw1TXVIBXeDsnHMwB9KDa6/i2d/LT4PbYBRMoBYMRio9q19RO
         GqQ64QZC8BjLWHqYideLs5A7CXfdWGpA8cSsVR8lB/TO8eAJViKvgpDDRRoh+nmcEdfC
         8hAE9F45/kxaY2UqJgtXjW7j3QfBQUVCnLy5hvreyhRvhmKOgG1M34bCxLBfRp4nMxxf
         Iaxqk5DnZt1lDv56JxZ9SbDY+PUQ8vtueKMfpsLLZxgeOLWntcxeuJdarYoUwoTYHoyb
         uvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761227; x=1770366027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=;
        b=Tjn0PuRNka06ZgC4yi8BR+NgAnleH/2+GshwMeL0zPIfv2Aq211pQ1fdOvECBdagdF
         yh8lNtDSpvpEIFGL5jVF+aodzFABianCYOu/WXbMXqX0zs7Zme7gvAn6RFXbttWSjUY9
         AC7STrHWavQcoyab5dWoa+VvPmQjbriAw7UBsJoHy5afPNUlaE3PjhHVWwh96xwInytm
         yYnQa/fnv2nOy1tADv8evL6Oxb1E++UCfK5mEldhLrsoLhZMGA6j8KpSebAijvQ9MX1L
         CoLnnmG5Wcc9Bz6IYGnM4i7G4U8nU2RQ0vl4K6nolXWdkyZnS1wloU6xgoyR2F3h/BSi
         QwEw==
X-Forwarded-Encrypted: i=1; AJvYcCU25v6i5IZYtn9+4nYfriShsSWtCFmAGTvPwEXaFGVGkhnBAC4sApYBbyu/+oesY9cUitezQxd0iliIltI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsVJtR+JGhAkbbGoZSlyo5J9KD+16BkHcVFgbQHjky9Aa9wZTz
	liU2F9EEjgyqqdJVUvejp6bl1KIA/jBoKeMCsON8rCrsTdfyKBWJA39H
X-Gm-Gg: AZuq6aLYWuiKeXubjpmNnQWp8/5Y4mV02teYnUXnCIp7DnlvkXBLzpxvMdDXfha0wg1
	xiVb/0olaEawV0GeVCSqqr0fjcwlNYg51H6Ootkw5AFoxabJD3C6lcsxV+f/nwa+v+HblZyY4h9
	wGymDTvuwiVf6+XVgD8W/vX2JOKQENrk2+Z9cHoGlAiT6LrZR4kk4zZmKUybrroNnh9OhkJmvSW
	OoYrtSMDT6bIRsw0w69JvEo6LVGHhYu2OQU0bNk3PfTlh3twEmp2SpuMUjkoQS8jH5XbWUHf3QL
	SSYRPqGp/QeVANvhv+6i2FFhsLM88Mi4LU5c0XAJ1n9kdqNyli5fInJUap++R62pybVKPBImIcF
	4eRShBc9ZZ9C8so6woiYRnXAqBaeq5E4YIiiIk60z4qeFO/r2leuDKYxn0jpjtT0xg6TPhUnVhv
	LS5LBtHW7fvhuPbrAcmpqgegb4sMiuU20dCARod4lolFmTo/5Pg4ui3fiBvcb/6O2IxUW5RLK6p
	SytnhTzDyJjdKh9nMQP18Iern2ymR9/hpqnVL37ksm6we0DLNPeBYuE0aNCS8sSHxX/S6Jtlfry
	a2YH3IJftZ2r
X-Received: by 2002:a05:6a00:248f:b0:81f:d605:b2c with SMTP id d2e1a72fcca58-823ab873c6emr1897727b3a.48.1769761227270;
        Fri, 30 Jan 2026 00:20:27 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:27 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:12 +0800
Subject: [PATCH v4 4/7] ARM: dts: aspeed: yosemite5: Add ipmb node for OCP
 debug card
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-4-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
In-Reply-To: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=881;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=MUMRve3kRE7pUB71SRAZkcB7pmeSsMqBTIHoXuxoOoA=;
 b=xVUYwrcxIkU1SuQ/nolx2k2lMN8102NKwD9efGjRAnqhuerUKmSd1F0eTs6qi+z2DjrAuDsQk
 ONI9NH6YPyfANvzfoyAAQenwBd+SDtNInZj1ywLnaatpk6SYI5Ceiuy
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DATE_IN_PAST(1.00)[62];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3446-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amithash@meta.com,m:Kevin.Tung@quantatw.com,m:Ken.Chen@quantatw.com,m:Leo-Yang@quantatw.com,m:Jackson.Liu@quantatw.com,m:kevin.tung.openbmc@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:kevintungopenbmc@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,meta.com,quantatw.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,0.0.0.10:email]
X-Rspamd-Queue-Id: 3151DC76C6
X-Rspamd-Action: no action

Add the device tree node to enable the IPMB interface used by
the OCP debug card.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672bbcc859de2b89b722 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
 
 /* SCM CPLD I2C */
 &i2c7 {
+	multi-master;
 	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c8 {

-- 
2.52.0


