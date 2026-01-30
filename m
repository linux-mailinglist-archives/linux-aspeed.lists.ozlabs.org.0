Return-Path: <linux-aspeed+bounces-3452-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HY5DpfWf2mbyQIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3452-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sun, 01 Feb 2026 23:41:27 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E2C76C7
	for <lists+linux-aspeed@lfdr.de>; Sun, 01 Feb 2026 23:41:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f44V65VG1z30M0;
	Mon, 02 Feb 2026 09:41:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769761221;
	cv=none; b=S17Xk/SOyuI+RUrkBe1wT11oJ2s6zowp0g6xvDX966pIJZftr2Ruj6Z7rXaFm2on+Au90zVfLLCTceFMXdC7xxAK+WFQgx42RWHENys/mp1DAduO2GPytmiLIqsb6n1qpe8a0E4xhsS4cQkwQC6kMN82Nm+hoRen+PZplAiToavkQ0lmDuEHejSXjnMV+qcH+wsH/itTRjh/AFG9xUsbYFzg0iy3JUkinCr95f9CtHR3KXXTBhjWL7zMKrKaEnYwXwhdJIzUYBxTQpMZBPoPxN+kx02vXdSiBZcWceXDJHv2EQ//8d4cNpd5YGf4ZopTM3voyAUuLl9tgvLw2i5nFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769761221; c=relaxed/relaxed;
	bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ao6cngWid2H8szfCwLvN+k/EZY5+AOYnUC4CgdVaFlOTBrUhj5X+672bYBzPDGO5HAgYmNb1HYr3GaxPhzGCgXYRfn7QK1ReQrCxNQgJtFEjZorNPcAo9isVuxIcej9NxbLCvJtsagK9F75Jj4//UcVlhXvsjonUK6VokeOoIBHPm6f1b6BMmti9RXMusOWfCdLFjw+RivYQ8vI/9UI9JTgletisUreLeQMdkhYDpib/FJB5hq2BiT48fKrX6XhPHJtvCH6wL9lJ1yryjcnwDu7uGSnivOe+k3DNrdrGRQ2J7iemtn/NMdLt2mVK2Hdm9hGwpfRSsIKcLa37SGeCVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aYn0GXRA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aYn0GXRA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2TTd1Z4mz2xjP
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Jan 2026 19:20:21 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so1510743b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Jan 2026 00:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761218; x=1770366018; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=;
        b=aYn0GXRAlC+vDjoWzGTNbTS429SDdUDpunN+nCq0l9wnbn/DKKHiBAdjU6VlyYLm/A
         iN5X0Stkl7+fJYw51M2U3ETgsUCWWgOnaRSlUlcW2hogjfS5lW8MAE9Q+a86Nn8wtOv1
         nG7taJUkVmFWeIfy9VEVlGvIHjWjb3eZIqqlOENVZJM0DTIXDu36DPvZfq7oS7J9rmly
         salZkPw/cU51KYQuLpsS4aGV2b7E0xKd6CjHjp48VgVB4nkQBlOIiZPBTst2KZ16QZ4z
         /peHmWTfnSN0M2kl+vjmDBYH5zDGwRXjslI1r9MKiUajypDLCn5VSMJkltS6n148JjO3
         64LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761218; x=1770366018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=;
        b=CohnacodLj4dCb2Z5BVLBBIY5eHEhKCNcsq6B6Ykjf8bDgZP1NHXDLEcPeEPmhAOX7
         bwQ0RUFcEI9PDIeDrAwthsFEHdRCXzEwMEJrk1eGHIf+tBLUgiOSCOUUFhsC1bAjkSfq
         9yGBrsyOp1GFD1RvqWth0ELiC96uSmTTd0axctn7Zw0aoxCnUfbSbmAcpwkFBVWQ1OQc
         Nl2O3nensxW5nAivXA75ChEh2NGTFmEdzDtryhWpYJcYGFyUTBcIeH+dixVAHI+S9BJa
         fGsuB6uOc0XisMrvnA/pEAXfdBvi0berxYYU2hTjmo1c4Ivnjfc7l03A9StdyA6KYCz2
         p7aw==
X-Forwarded-Encrypted: i=1; AJvYcCXXaQRnlu8NHC2UZ/JtlHm5mLZ0pbXAzxl0omAhoxEcsKR/Unk7KuCvxsXQpXuL72CH2C6lGCa3N9WLFRY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3ecKXuzz+I5pss8gpMnJ7bzwquhHcc/NVAm2OffTPzz94YE+J
	fWA1RQbenALJhVWnM9QhYdHM9D/HTYulzJp5jSEmdEujY9icMN1UZ9b/
X-Gm-Gg: AZuq6aLsUkHH6//LonXaZXenfod4tlixuk64vB6+TJ3dXQ7zCchA/fO7bFj7lq9htcM
	yotumuC546olEEdHNPBbzycqXFpFtUMh8hAhfUe0LvPwjqCYwyq2yzVgd96ZOXfcoQ/pwzySvH5
	b685PAHgqeYICmsZkMutj1ryiwZh9wc7ULsWppXrHn9mlgOWtfmWLQH1R32XoZ1QhBM6US3FdCz
	pRO+uQx2tUmlq8YDLwoTWn+rovCYN4CFagCpyWpmM42C8FFCxnPBr8++jlZIM6Nq0bWWQT3px4G
	OJyJHk5JbY2cN0PCnNmI6/gCwY/dU877WPn+3bGjPi9Kj7J+W9awjJzdCWKtEtimvYb0Oms+7uP
	Zqt/qi39DPqz6SpPwXd3fVlQBvkZkXCovCTE4XjQUbF5QfDWObm2jpaqNBXrqaNctd0EF71vM/A
	ci/5Ksfd6s+ymd5I8QFfNzfZvwqvFShBLG7nkycFoz9322eFJSO8gZ/CsLqfdR1MDgN5rmFnmD7
	KYW/09cooPV3m8CZg7jVK1XO8fNWJ0bcC6q16axIF0/IyjmJxhC5jLPi9pqz34dGjcuUILllEoF
	dDHQWWkrS0E4
X-Received: by 2002:a05:6a00:2288:b0:81f:2140:136d with SMTP id d2e1a72fcca58-823ab65a295mr2190012b3a.23.1769761218223;
        Fri, 30 Jan 2026 00:20:18 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:17 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:09 +0800
Subject: [PATCH v4 1/7] ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12
 bus speed to 400 kHz
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
Message-Id: <20260130-yv5_revise_dts-v4-1-4d924455f3a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=1020;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=hdlRtRi9TLU18op7sSDjRmIwRirYAAfHoP1MDNioDPo=;
 b=fZnmMsrIsXktT/r/q2+TsbkJWf6xIrrJ17bze8j46nQ6BUBYHD2F7fsRHq+ze/StaE71TqDCy
 oa6BXmcCqmADPUb2cmft+rFczUbHRKCwFZ2DBi/fAeMujioTcYr4bQq
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[62];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-3452-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
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
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,meta.com,quantatw.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4b:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,4c:email,0.0.0.10:email]
X-Rspamd-Queue-Id: 377E2C76C7
X-Rspamd-Action: no action

Configure i2c4 and i2c12 to operate at 400 kHz instead of 100 kHz.
This update aligns the bus settings with the hardware capabilities
and improves MCTP communication performance.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6bd36f3fe780b21e834b85242f8aa9..7991e9360847532cff9aad4ad4ed57d4c30668a0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -231,6 +231,7 @@ sbtsi@4c {
 &i2c4 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {
@@ -782,6 +783,7 @@ adc@4b {
 &i2c12 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {

-- 
2.52.0


