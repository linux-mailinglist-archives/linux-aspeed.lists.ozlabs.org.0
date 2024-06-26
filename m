Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45C9181B9
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GD/bIhAa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MRJ6pHLz3dBM
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GD/bIhAa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQb2wv2z3cbd
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:15 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fa07e4f44eso37477465ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407174; x=1720011974; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhe6DN+SBff5XTkDHWzhpS9fEwRiEep85mCGDZa7d1w=;
        b=GD/bIhAaAMHLLerzW1IoNGjAaq7WEJibe+PT8KMNHrIn5nCTpU2fDACZiR3mqd37iX
         Mlb8RrB13WvEFmKSpDsnoFzTZNulXrChKExfx9iHxurg8KLkPYPb6QfEzbiYwAhmev6E
         Dy969Vc6hIpl8GbIwsOQ0Lrll/B8bZHNCX0kIWWbYuOpcAdg/9DeKuZUwDVhHPwqLceW
         kMNpiQkKP4cmVRqh39g/12kmEAuRHLI6Pw1JUW8auzYGxIPCnc+RJu5jAkkjDwww7qB3
         kVx8DbgpCREBdf/4muIiv2cBV1A7z9el4JF+2+IVet2O787UryWc6wVA4qTOIgc20fxu
         b+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407174; x=1720011974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhe6DN+SBff5XTkDHWzhpS9fEwRiEep85mCGDZa7d1w=;
        b=fSlO8FQzO5wdVXm4E1PbkVi5eO1IC0Kh9lzqt6WYdUQS04YWP+xokY7d0Ncgj493/N
         WArv2r7l6A5FnkPLVli/CHaR0uqSPmJcyNvK9cJcO74fR6UswK47Zy3u2hwR3jJWk4l8
         YsPdARVxXF1Rlpwj1RgP6kx/2vvYy6uQvv5vxaZOoQepIitS3Wnm2/93xMnjg5Ql8fn+
         kr+aJZ5N33xS2VaYi2L4X6cS7XNXSr64Y8jropFAV2/mUFGQSx3yEuslQExYL0G2bTDp
         tDh9ZLrM0ySpy0njL6koHiOaXfrcmfI86bvSk4uaAge6E/zd9K8ShqAUYr7p3VlvFLSo
         l/UA==
X-Forwarded-Encrypted: i=1; AJvYcCVIkOFVH8pC5j3I66u4aE75SmwUlxJNKp5BUNpTFxQJHi0RcpvXoqkJZv834q5sr+kGHTvlZ0UU07roOLb5rbXkbbHE9e0OuE0v1hTBTQ==
X-Gm-Message-State: AOJu0YwNZbzLInZtarDlHrOm7N0VTV2pURIybbPpjTBsJyObduD0HBRR
	ZzyX4VLCDP6OOJjyQ9R6swZyIw8WuTJh+N2sUfwAQ0azxjGKSPWGTd2cK5I3
X-Google-Smtp-Source: AGHT+IEnvR79PM2kbP19MxXJTGNCuQmeLblT5t4YPlM/FBhWqr94KqmbokkHoLxtV/Dx2zTKyZtTEg==
X-Received: by 2002:a17:903:2291:b0:1f9:f3a0:62a5 with SMTP id d9443c01a7336-1fa23ef7dfamr123367765ad.53.1719407173429;
        Wed, 26 Jun 2024 06:06:13 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:13 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 15/17] ARM: dts: aspeed: minerva: remove unused power device
Date: Wed, 26 Jun 2024 21:03:30 +0800
Message-Id: <20240626130332.929534-16-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
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

Remove unused power device.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 8f3f15a5c148..093305b598dc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -144,16 +144,6 @@ power-monitor@41 {
 		shunt-resistor = <1000>;
 	};
 
-	power-monitor@67 {
-		compatible = "adi,ltc2945";
-		reg = <0x67>;
-	};
-
-	power-monitor@68 {
-		compatible = "adi,ltc2945";
-		reg = <0x68>;
-	};
-
 	power-monitor@43 {
 		compatible = "infineon,xdp710";
 		reg = <0x43>;
-- 
2.34.1

