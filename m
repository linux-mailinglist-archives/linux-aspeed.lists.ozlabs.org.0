Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D18907698
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:27:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bBLqnbkA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R993m2Xz3cXg
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:27:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bBLqnbkA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8h4qyQz3cVG
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:44 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70413de08c7so841312b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292404; x=1718897204; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HyReb+tsuJSpMD3xfx85u7ltZSRlX7HpcM+n+BHg+0=;
        b=bBLqnbkAOwcxO/AWn1jyG90DlZgLtsO5I3g0uEUUTKy8s/5LvNlcycef2GnvL97Kxy
         zFoJQDNkhqE+y8CbkLiYjVd7h2Yq84aG9181KJ8dhkXbgQj9FXnZ6EnE8uO9PGEZn9nd
         o5yie9Ceqc3SPM0KvhB9nJIcv2yvagln8moMJzwc6wNXAXXvz4RIpzq4uN+XzdJX/Ksm
         0Mlt1Hnre8WVdKSBAZqYLPKLHEExWL/0FHpLh+7dyjcIFuOdLWJg4Q1UttcM2F+S576e
         riGUi4DQW3XYcM4ckpUj6V/IU2ucs8Z7CfZpGtyThuSYax8LwSmO5rfQb2SiGzaxF1/F
         ak3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292404; x=1718897204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HyReb+tsuJSpMD3xfx85u7ltZSRlX7HpcM+n+BHg+0=;
        b=BR9BGOql3/GwVbzIeS5I2w7Dz7b420uZ6MuzOxJR1c5d8jhF5tpdT2gMW4nOhZytoS
         Y3F85EOjbR03vejqmDm9g/TIQd8utrXlYsO7tUERclVcs8GBAB9Zf/MuZqk7wm+L6aA0
         NtKy/iUyPCH4w6LZHR+ZuBiRQRw13Cj+hG0ZymZ7DcyzCGm/JZNXS5+WeQqSVPtfIeda
         wXdcScr5bALEYzaRoq493ZvChMTkttsnGs0sl+PO9LBxmTfKC0fuoc83529vCE0SPaCc
         XzWixlAvX2Ew1ra9vLbg3loRlUy+zGP1UJB/f9+wD8aNmQNELfiXh/qu+kDAUNBoYhR/
         /+HA==
X-Forwarded-Encrypted: i=1; AJvYcCUpIt8fpeTcZzpu5sLSF/YM3qxYMJLzsVrg83wcwJ/DFOG9vqMar89ODbz/nbExIxcc+rAho+VL8nBZ/07AhQ2MJ5C8l7i0AEJNNXn2/A==
X-Gm-Message-State: AOJu0YylXYMbE1rzGd0Ud1M6zH1/Ia/iU4poW3KMjSm4nMZ0L6batXrJ
	OpQBltK+f4rE8QxQGA9TJJ3Du9wHOpXqkeqkmDZSR+fohAmbX7j7HG/Hfw==
X-Google-Smtp-Source: AGHT+IGZ7dDSpB0gDemGbrl1Ls8xaQvWnphT8vuiHuA6tgCXfC9dRPueqxT/h9PdKJgQ/EMmxevOFg==
X-Received: by 2002:a05:6a20:3946:b0:1b3:d59f:2d87 with SMTP id adf61e73a8af0-1bae82f6f36mr169561637.55.1718292403843;
        Thu, 13 Jun 2024 08:26:43 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:42 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/7] ARM: dts: aspeed: Harma: add power monitor xdp710
Date: Thu, 13 Jun 2024 23:24:23 +0800
Message-Id: <20240613152425.1582059-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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

Add HSC xdp710 device in i2c4.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 05020e23a901..a9caa66a59da 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -329,6 +329,11 @@ power-monitor@44 {
 		reg = <0x44>;
 		shunt-resistor-micro-ohms = <250>;
 	};
+
+	power-monitor@40 {
+		compatible = "infineon,xdp710";
+		reg = <0x40>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

