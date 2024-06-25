Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDD5916795
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:22:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GBbozYGD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kV36wG7z3dSx
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:22:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GBbozYGD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kT90xPVz3dX1
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:21:17 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-706642b4403so2177979b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318077; x=1719922877; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPpPQPrSFdxwRiFvGPyzNU87S8im5iQckUTLujqJKDw=;
        b=GBbozYGDgOxoK9pWyxtaA3psLxvkMdzKb0TcCFSaF/z9OxABi/AsfW9r5YclPebBs5
         r48eTrDi/faxXwOhVw1AMC4LMGTzPilN57OIycSvAj3UkW0wkZmLyXGgpGsA/OQkq20/
         Ji6oHpsKQ84CUcLDnpUsh8aiZst3HhCexVg8EhXYTIKFBeA10W9Fm64sI7zh1gwBErPL
         /Swt7rXIO5JuKEWUE6b/uEPY+3+pmQ656ot/dvAh3RiqfyXMpoLpNXjeuH1KFc9SLRqA
         cN2KtnVH5RtbJExSIiKGaDGKnjDR3uR8pl145JjP1ErN/XzIIkH1jrVJgEiE2m5bkBr6
         8Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318077; x=1719922877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPpPQPrSFdxwRiFvGPyzNU87S8im5iQckUTLujqJKDw=;
        b=Eco5ScFgFd7E3OYENx1ESSYnsOQppcbplkQmYxPaHsfPPVzWq9UrzZlcQCZEbGHFVM
         oTYvZJT/iS3xqkiEcZxHNuzZrOw8ibbTSkvPkb6mNR11hpEOVvlyittz7+aDRyspBa46
         UI8cfg+O6cmPa8DyUB+qIegV9Ti19VFnLDGc5iZ7zyjh613+Zp5Jr7tHOrnEf8S9aQt+
         OTAChPBZV+SmAQr+ddQoP7NUm6/C4DDwLqAAa1Y7hSEJ7rSYoVP4FQbYiXoKRGVL58HH
         t+yMV9kVF3kD5R0sK7mnV/t4O8t2NXCvgTJ+A/XgPwOqOxLH4zYHlxFRYXNtQpYOUjoo
         mK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFkWCJKRrPhDq8U79M4/tCTDE0sgo2vOLwn1x7+L9dJtmVUMtWS8CUaN97JyDMRQhvXRHYRKD2no7eVV8BKZA7i5vUPNU8416YWPLrHQ==
X-Gm-Message-State: AOJu0YyyI8WYme9M4F+/FZJ0KHA0UqK+YIL5S3PB47Pbb+C3/Qjma65E
	5meSYkSGL+kwqi4IK2P0V3DAVz9Q3U+OV6Hqcx3Vol/s1qnyVlP/
X-Google-Smtp-Source: AGHT+IH45w9VIPw2Adgujbb05Hh7fQwfR4efuZfljK39HStJbVTuQ21UuyqEOGETLUCEErof/GhyMg==
X-Received: by 2002:a05:6a21:339a:b0:1bd:199a:6347 with SMTP id adf61e73a8af0-1bd199a652bmr4424258637.5.1719318076674;
        Tue, 25 Jun 2024 05:21:16 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:21:16 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 17/17] ARM: dts: aspeed: minerva: add ltc4287 device
Date: Tue, 25 Jun 2024 20:18:35 +0800
Message-Id: <20240625121835.751013-18-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable LTC4287 device on i2c-0.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 288d4ba06b99..896e84cd03de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -165,6 +165,12 @@ power-monitor@41 {
 		shunt-resistor = <1000>;
 	};
 
+	power-monitor@44 {
+		compatible = "lltc,ltc4287";
+		reg = <0x44>;
+		shunt-resistor-micro-ohms = <2000>;
+	};
+
 	power-monitor@43 {
 		compatible = "infineon,xdp710";
 		reg = <0x43>;
-- 
2.34.1

