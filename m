Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C532944FE6
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:03:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CPfcI0cu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYfx6SBCz3dKH
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:03:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CPfcI0cu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYfq3Gbhz3dTC
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:03:47 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70eec5f2401so4460709b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528222; x=1723133022; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oqZSVf3Pja7+3axQ7FhMBZCb9fhp3k28x1dNv+Nkh0=;
        b=CPfcI0cuahWMiFWWpq+FcTg6K/u3C+F40Xm73ZJdrpqf2HWVX7xmUe4cvGKQwnXHdp
         yt0kgbMIijfWYgsn8Rw+h53XKuEE0PgKipXm3CLfzv3nbnddds4g9Jr4k84RNaMkHVGr
         nkH/QsFMbRxcr3vAOvmvxe45YWR4lVfpjB82UmSOUM3iDobtqtB13JixJdX7HKIA+DVD
         nyJaGVFG0bGTzUwZCai5UAeDU+KK72eFaQmBI3DSIZjWLQgY4JQVYpKjgywfCFK1m951
         gIFxQClorUAP07crUV39lVJkMFqcjORC5SPtRXkyahWLoLgvjseoL5Q0dDUgT6hXl3t0
         jI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528222; x=1723133022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oqZSVf3Pja7+3axQ7FhMBZCb9fhp3k28x1dNv+Nkh0=;
        b=wXPUewOF2wwixLvZafNAIPiMMHgK2YVUC/S3Ifn2m0NQYaZRvuNckjUqM2znbipxZc
         dikw3Jn9bBd4mhEsMW3mMZw3K4KUFUPD6vO325vsi9A2SgniQ8adcAkrtRMbHvj+fZRE
         4+0Rg+VQLB3poBysBrFV4x6CIyUqKVJMJuqHDMXtY76M2Ak5LhV9cQo/98xmDfwLRPW7
         Qbj16DRLEnhojJs68AkTt9G2vCW5YUucNZxVt4/heOSGMvjR50j0dKz3GH8grKVxeKYY
         V5hwtHRDH9LeqaU3N2nv3cFaAeycriVoxONJBOrFYKCzCKAGowAC0PHcV4Pzt8kJ+6L1
         DEfA==
X-Forwarded-Encrypted: i=1; AJvYcCX6lUpIVBUt5zo+24WqhwyWLR9bb3wJ3W4PaykhCobEK5BIcIBPpoyhT124RuvC4O/VE4/DijL7i/4jvCEOuW9tHvPJzz540s24HpWh7A==
X-Gm-Message-State: AOJu0Yw5xu5/YAoVUluf2ngduL7wqxC0xEuf72ye+xUyd7ZbVN5oRmqB
	wGI2LFUHWT83e4/l/hdFUXoRqr/xym3l5IlkP4Sg5fs0o4pR5cXT
X-Google-Smtp-Source: AGHT+IG6tg51ynV80wHlsk0sv7Mrh3n5BGlH6OX14TfmA459p8pb2kTLYFECWUzhBXE/TS8GtQj3HQ==
X-Received: by 2002:a17:90b:4b92:b0:2cf:f3e9:d5c8 with SMTP id 98e67ed59e1d1-2cff952e810mr843435a91.31.1722528222522;
        Thu, 01 Aug 2024 09:03:42 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:42 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/11] ARM: dts: aspeed: Harma: revise hsc chip
Date: Fri,  2 Aug 2024 00:01:25 +0800
Message-Id: <20240801160136.1281291-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Revise HSC chip name and address to match LTC4287.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index c118d473a76f..d99fba321379 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -276,11 +276,10 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	power-monitor@22 {
-		compatible = "lltc,ltc4286";
-		reg = <0x22>;
-		adi,vrange-low-enable;
-		shunt-resistor-micro-ohms = <500>;
+	power-monitor@44 {
+		compatible = "lltc,ltc4287";
+		reg = <0x44>;
+		shunt-resistor-micro-ohms = <250>;
 	};
 };
 
-- 
2.25.1

