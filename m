Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5D91678E
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JANYcj5f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTj6bqkz3dRf
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JANYcj5f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kT12RHfz3dTf
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:21:09 +1000 (AEST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-36dd6110186so21259185ab.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318068; x=1719922868; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx72SI7/2IoQxOX1b/fnYis0HzPlfSdpK4NVpZfxV7Q=;
        b=JANYcj5f4lIvPBBqhwekrer0cCHdwiblg0blYGxJ8xmLz+r+ZVcvXUqcPQiguumwPg
         El3AASRjfXX0HwnIuqwA7HoLofUuWecX90l4c7CLBydRNFLCIkZKZnPrJKERrROVUuaa
         z1peXXIhB+U9nb86IO8jfV8N0hmAabvBsm/y0MmvfUY5K0Cg+oYXxTnfawl3FUwzj7+k
         KSLar5DJHPE+mKaLFU18qlY5u9e7NJeujs68sekegABN0lxBCie5C+82aCXiDfJedyv3
         paMwOKYErzElmkeO2rDOziq2loO9HwGQDY4EYBOkgzfE9K6bZe5ZdPxTIgOb0d3OEcSn
         Mwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318068; x=1719922868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx72SI7/2IoQxOX1b/fnYis0HzPlfSdpK4NVpZfxV7Q=;
        b=o/6JF3Sw9udna+EfmViMgHmWhnL/XCpSg2crDg+59fJMO/5qdxLwBwvjQoq7ff4OPw
         Tslod5DXdzn+sl6I3xrNK4Z3AQCwexSdY36IWveG4N7GBJdY6JhtQH2+iFWfrtFP+UGL
         pYNXqDWGAQKvFpgeVXoJuwI3tNRegurfQZmGYopAtfa2NEFMyRQpyxvyTI51HXNBeXnR
         NviUjFubcGc7g05/zZEz1KOo1SyHzBK3vHShws5cCm+XuyVlItm8IThYm7V3ZvJsHHgu
         w9XxN8ZAQF/hodnaPXldEHYcxwzoQvPIvo5Io9CmlNjgH08ONJMXLzzTjfv2CpLNyflV
         nhbw==
X-Forwarded-Encrypted: i=1; AJvYcCVeCJ7o8KBPyqZFsg9N0ykBvNRwx7xP9t9w4ojnoqH7e4LvqUDMXm2fn7mmNqtlJJXE3gDgGriAo4qxyGCBPwyA9+24DpQeGYza4j5ljg==
X-Gm-Message-State: AOJu0YxuIxXK5Zk03SGkgUHCPi9P8XqjJEACtbyy+F+xKY0gsBpbVWcJ
	6GZbSVg8wIlu4SmxY+rQo1rYp/77jbFdxlfqMsfYhANJj2E9qeKq
X-Google-Smtp-Source: AGHT+IHOZoufCr8RHeLNcTuCCK9wtsYm/Zv5j+dnx22Bzhr+SOZilu3p95OTzvWMtGuQrrJqvyzVsQ==
X-Received: by 2002:a05:6e02:1d0f:b0:375:b57b:877b with SMTP id e9e14a558f8ab-3763f60dc49mr91838265ab.10.1719318067752;
        Tue, 25 Jun 2024 05:21:07 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:21:07 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 13/17] ARM: dts: minerva: add power monitor xdp710
Date: Tue, 25 Jun 2024 20:18:31 +0800
Message-Id: <20240625121835.751013-14-yangchen.openbmc@gmail.com>
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

From: Yang Chen <yang.chen@quantatw.com>

Add HSC xdp710 on i2c bus0.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 7f6df8750953..dd8240279ed4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -175,6 +175,11 @@ power-monitor@68 {
 		reg = <0x68>;
 	};
 
+	power-monitor@43 {
+		compatible = "infineon,xdp710";
+		reg = <0x43>;
+	};
+
 	leds_gpio: gpio@19 {
 		compatible = "nxp,pca9555";
 		reg = <0x19>;
-- 
2.34.1

