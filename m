Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C639181A0
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:05:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=awxLFtdN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQ20Fmqz3cV5
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:05:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=awxLFtdN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MPw1Rs8z3c5J
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:38 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f9c6e59d34so55099835ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407138; x=1720011938; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZEw1g07ZLnQvFZWEHxbSy8GeOHnIuAb8MiyryT0YbU=;
        b=awxLFtdNUUc05ENCPf9yzPONsJjVV5VOmGbwpcCDbn7eGd/C9ybhmN520oZHI0CBoD
         lymPm/xxzS45gkB3AYVQ4D4MAtdG5lfQPyiqpJhsVKiLyxRfTulBT8csx2ITdaP2sdzb
         O0EyYG1ZBaxvQQQnCzKHydthZJgrGKoxJvG+MuUqlN+4IUflE03xQiSQxQuG1C7R2UMt
         r05Iz40V8Wo9q4g76/8h3XeBYFFOxV4RibQjEXSlT3Ca5jWi8lvrlyVkGUPmwv1OjEfq
         DcG/wk+8d/t3T4Xy5Tpy8z84KpvccZrZXtNT2C5Nhgz4C+Iiqhz0tgA7tMP6x9uScz0J
         MaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407138; x=1720011938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZEw1g07ZLnQvFZWEHxbSy8GeOHnIuAb8MiyryT0YbU=;
        b=XFzUl0ASWOEEqHOXySTo3A5toHkIRsYwwli2HnniiInaD3TW8NNFRW2XR9JF38h2yA
         859DQiKYL/tXdQGL8ia62WlNzkXdl62EZtaphzmgWU5ZfP3Vh8ZXuVKbPYqbsHG5s8+M
         uVjSjnuQ+AYMnH1qXhSzBP/VYL1UY7xtvB/tfOCzxpVCzWiCYFDfnnVFbLaBeoN5Y9d+
         RHk78jtnajNCjGAxrvHx5p9mbOQleazWAHeuH/Fr4CgAQuGLyuJ3Lw+BP/H/jgY1JmLx
         d/OZFI1a7SrkWTAf0Dp1+VlGFmuYhSw3J21GpnipxWCrH1L8w31sx2O3FFBup4rPezCj
         PGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhCsCxvy06sGp0IxQgvTo0CulbcS70kHpqc/cg/RYK4ZSsMfm6SD1XQS+WWmTKF2n6JCmEBjSZzj8gbJUyMYpD20FulVhLsbdZI47e3g==
X-Gm-Message-State: AOJu0YzD1F7WvkKaFkkyoNL68jmCWZ9RMzExia+zIC01ijaROucDH234
	1+WHj3Bbk3NomEIzaqkGTST23RihCURKMuKs0ASQf0yMRPVSJVOm
X-Google-Smtp-Source: AGHT+IEu3J9iziZNrqrOUblp2zL7pUOD6XFZ8442+63lf5VR1h/a0E2Ilv1q41eUPQoLZyYHEBSiBA==
X-Received: by 2002:a17:902:c40c:b0:1f8:66fb:1677 with SMTP id d9443c01a7336-1fa1d3de606mr131873165ad.14.1719407137507;
        Wed, 26 Jun 2024 06:05:37 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:37 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 00/17] Revise Facebook Minerva BMC DTS
Date: Wed, 26 Jun 2024 21:03:15 +0800
Message-Id: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Revise the Linux device tree entry related to Facebook platform Minerva
specific devices connected to the Aspeed AST2600 BMC.

Changelog:
- v1:
  - Modify the properties of spi to match the schema.

Yang Chen (17):
  ARM: dts: aspeed: minerva: change the address of tmp75
  ARM: dts: aspeed: minerva: change aliases for uart
  ARM: dts: aspeed: minerva: add eeprom on i2c bus
  ARM: dts: aspeed: minerva: change RTC reference
  ARM: dts: aspeed: minerva: enable mdio3
  ARM: dts: aspeed: minerva: remove unused bus and device
  ARM: dts: aspeed: minerva: Define the LEDs node name
  ARM: dts: aspeed: minerva: Add adc sensors for fan board
  ARM: dts: aspeed: minerva: add linename of two pins
  ARM: dts: aspeed: minerva: enable ehci0 for USB
  ARM: dts: aspeed: minerva: add tmp75 sensor
  ARM: dts: aspeed: minerva: add power monitor xdp710
  ARM: dts: aspeed: minerva: revise sgpio line name
  ARM: dts: aspeed: minerva: Switch the i2c bus number
  ARM: dts: aspeed: minerva: remove unused power device
  ARM: dts: aspeed: minerva: add ltc4287 device
  ARM: dts: aspeed: minerva: Add spi-gpio

 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
 1 file changed, 373 insertions(+), 143 deletions(-)

-- 
2.34.1

