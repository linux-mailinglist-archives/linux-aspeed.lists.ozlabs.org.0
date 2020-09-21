Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BDD271EBB
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 11:17:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvzNp1jSdzDqbm
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 19:17:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j5DOgZ4q; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvzNP19RVzDqdZ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 19:17:08 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id fa1so7133573pjb.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 02:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sn5K/Ys4ffnC/CyJiVbEeEFS78Vl8Zham2P4UxWGNJU=;
 b=j5DOgZ4qszU7bfjOt4m2bI23gOkc2lxMD2ZlNSuVDQQh1TEYqXUL20mEke0dBWjD0G
 LdtvuZJc8TCK8NZPBx4IVi2xZ0eGOlSrkYMtyV/sb9H81nVJtjbd1XDHoN5GuOtDBnH0
 v3BAjNlgm1aqaF+aE9SERxiF0ILDWB3Cr/FwCftJG5xC28cvcQKRt8++4WoKLrDdeRYO
 zFNFQOAtA4Z+HiZ3asZB3m9TjJQe+/RobbF4uEXw2IoDWpy9OD0qkQ0IPZC+4k7E9bac
 /8BnIFhjfp9oe3CSSBqwetRzOYV+HQM1QYIH+KpgScj4IpE792qM/wMOzWSESfSqKSk0
 WGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sn5K/Ys4ffnC/CyJiVbEeEFS78Vl8Zham2P4UxWGNJU=;
 b=pGjPhtrk3nG6mgU8erWTkVraKL7ZXUvXvSV4jWEU80T5w5YsD3Vwg6U+nb/41/9CD8
 470+VYpK4EXQfVqsYDGEras3Z2ot/9ATYYlgL8L/74oFI5RseLbhrxDqZsd+eq3dMSeC
 9H36AgwlK2JhFiOA5mndkx38XEqC9fokqdJc381olhgyx6Vf80pVvUG3JyANHmcR+nla
 jCWKMvxuRQBhzF2f4u22SsNr+TJscqovJPYKeOPdYPOudnEuJg84iZf9/azqJ/tpFsKx
 zIXKkRGpgh9dIHypTrWUUUvoCJhUJLrZ5xPK7rwb+3zAdKr1TgrT2b32evIyeapzpIw3
 AKug==
X-Gm-Message-State: AOAM533tcN8LUqBPZQU4mBaFH61BjdKs2VDuKbx1LeMeGMl8jYrjVTsO
 mB0UVb1EhmBKuxv/5SLX/cE=
X-Google-Smtp-Source: ABdhPJyIJ30bJu40sRZT1WpTmfeK1pthj3AVWC/Gymfjp5WKgSeZOivdPOYyolIQ7OX3y0hrK4VWog==
X-Received: by 2002:a17:90b:f83:: with SMTP id
 ft3mr23676343pjb.234.1600679825817; 
 Mon, 21 Sep 2020 02:17:05 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id gb19sm10105690pjb.38.2020.09.21.02.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 02:17:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 3/3] ARM: dts: aspeed: Add silicon id node
Date: Mon, 21 Sep 2020 18:46:44 +0930
Message-Id: <20200921091644.133107-4-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921091644.133107-1-joel@jms.id.au>
References: <20200921091644.133107-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This register describes the silicon id and chip unique id. It varies
between CPU revisions, but is always part of the SCU.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix whitespace
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 82f0213e3a3c..b3dafbc8caca 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -192,6 +192,11 @@ p2a: p2a-control@2c {
 					status = "disabled";
 				};
 
+				silicon-id@7c {
+					compatible = "aspeed,ast2400-silicon-id", "aspeed,silicon-id";
+					reg = <0x7c 0x4>;
+				};
+
 				pinctrl: pinctrl@80 {
 					reg = <0x80 0x18>, <0xa0 0x10>;
 					compatible = "aspeed,ast2400-pinctrl";
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 9c91afb2b404..c6862182313a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -239,6 +239,11 @@ p2a: p2a-control@2c {
 					status = "disabled";
 				};
 
+				silicon-id@7c {
+					compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
+					reg = <0x7c 0x4 0x150 0x8>;
+				};
+
 				pinctrl: pinctrl@80 {
 					compatible = "aspeed,ast2500-pinctrl";
 					reg = <0x80 0x18>, <0xa0 0x10>;
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b58220a49cbd..1ce3a1f06f7f 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -311,6 +311,11 @@ pinctrl: pinctrl {
 					compatible = "aspeed,ast2600-pinctrl";
 				};
 
+				silicon-id@14 {
+					compatible = "aspeed,ast2600-silicon-id", "aspeed,silicon-id";
+					reg = <0x14 0x4 0x5b0 0x8>;
+				};
+
 				smp-memram@180 {
 					compatible = "aspeed,ast2600-smpmem";
 					reg = <0x180 0x40>;
-- 
2.28.0

