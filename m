Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DE916777
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:20:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F47BFQAg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kSc54DXz3dTf
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:20:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F47BFQAg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSW1JMdz3d9b
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:41 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7eb895539e3so216107939f.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318039; x=1719922839; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56OHLeHM6KGxfr/ZiEEzO7pNMBMtLebkNfQmQtaAVfM=;
        b=F47BFQAgMh8+IfjZWLNoIcU8LUVj6TEOtHyXaAXBUSREa5QsjOiP0Wy4kXXAzPvZoS
         Ep9lkfkzRGju5eN2ThjuE1mBkvomeeizv8g/8kuZdzE6xCI0VMMmrcVw+2iYdh7KZxQ3
         RN7dVSz0LO5MHF/WVn8ro/Y4OkCUs3rQ/ocP1AV1udGxsiMWm0q6j7SQXusjq1aEKbI3
         5Nkle8O3yeNzDfiFDdGVgFx1NQSrSmZMafT5zn1P9tNWPizLpohTj4k58N3IH+y/f9ch
         vMfzBJX+aypcYJWy1U5uj+Hqgn3mXYqslDlUElQDjoPs3NAGYD8uVKolZiM2WZgcjMq0
         i94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318039; x=1719922839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56OHLeHM6KGxfr/ZiEEzO7pNMBMtLebkNfQmQtaAVfM=;
        b=nRiIMduKmO6FFSbcf8sIoQ2a4k67rs4Idpp54rpTdFlAkvA4h/JElsFC+3RFTW+3l4
         IbPP/49VRKatmwcNrAwSeqhPk1EZAuBgYcWqA5a4aLG8QVsCKBzld2mcAyuGwMP9Mq0R
         BydmYwI90DNrdENX2qVFXMdHJ9SovLjwKDgK6v0rRcPEzTPqJpjsZZrMGIuPQpiYa+k6
         PVbB0gRgtokJZVx3STk1PVX33fKvTFTAjsAhWcKSbNefrjOIxUeD/1PaJphvmAIQEyba
         gZl/o5j++hoNCLXsjABv2XgFAZYU8wFjDqi39oiMAA8gsgtX9kUPucy+O0WlD0lguxwY
         2rpw==
X-Forwarded-Encrypted: i=1; AJvYcCX6NpEVFlZb3a6Vw+56vIGHG8/Ss9WOKJbq4z7bOYuEmY2QlMOBOvu0WmP/r+a9t5H36r1p/FeBFCaIJI7E5FTPwu3RtjpbEnK2fHB7DQ==
X-Gm-Message-State: AOJu0YzWrTk2NV4UfY6xYX9NclKaeunnFejMaGY50XNdEc4jMMBQQRaY
	9FqdHxrzBVe3JEjxFauQGIxzokkyoor8wC6/CGQdj1y6H1SMz5tf
X-Google-Smtp-Source: AGHT+IGUQpFqlrYS/f5s9ricWY0f00ekN6AAhWQ5FiP2pjk95LET46rRUpw9FfLv5J/yfG8zjaH5IA==
X-Received: by 2002:a05:6602:6421:b0:7eb:97a0:8226 with SMTP id ca18e2360f4ac-7f3a4e36b74mr1028971639f.13.1719318039091;
        Tue, 25 Jun 2024 05:20:39 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:38 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 00/17] Revise Facebook Minerva BMC DTS
Date: Tue, 25 Jun 2024 20:18:18 +0800
Message-Id: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
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

Yang Chen (17):
  ARM: dts: aspeed: minerva: change the address of tmp75
  ARM: dts: aspeed: minerva: Add spi-gpio
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
  ARM: dts: minerva: add power monitor xdp710
  ARM: dts: aspeed: minerva: revise sgpio line name
  ARM: dts: aspeed: minerva: Switch the i2c bus number
  ARM: dts: aspeed: minerva: remove unused power device
  ARM: dts: aspeed: minerva: add ltc4287 device

 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
 1 file changed, 373 insertions(+), 143 deletions(-)

-- 
2.34.1

