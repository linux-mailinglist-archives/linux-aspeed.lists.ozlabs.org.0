Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B716E868656
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:48:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TBiTQ8h7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL3f3kwnz3vY8
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:48:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TBiTQ8h7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL3D1JtCz3dXP
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:52 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dc09556599so32668245ad.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998470; x=1709603270; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aW3rP8p4z3TO0Ihdn0FuHfBWSAl8GOUADIxx8TKfnls=;
        b=TBiTQ8h7qpWyBxNvVCSbM0Tt0Kp24jIJXbnp1NXmo8tGlj2uvKct0KckYRCCmMsixM
         osEpYLBtwAVdSubu5sZtT92HfeEujOAvORF+D5wzWqRgvCJEvWYKeqwhPm0+AUojPmNn
         8A26gxKe4QCn8syALmIbnd3IYEvRUueO7/1EdLoiGtImTcuOITVAw1Wn49bTfl0mVUey
         OI2xCZyCC/DNf0gWWSDCL3Cqd6vDStjZkLhzXvxxLY3HfdWLMH2wustI1us9efMpodYU
         BeedPBiVBs/kBe6NaiJvjhIuVloOQTwe1CYgDFPIbvryuQFh8lyrXXaaJMlZ7Wwtrgbm
         MGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998470; x=1709603270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW3rP8p4z3TO0Ihdn0FuHfBWSAl8GOUADIxx8TKfnls=;
        b=LJSrUrAPuos6ogtbV7vyaA+lqfYNRBXN7H0Usa9SuCdtckNRqF93LNciaMmtXwFzNl
         h6gm4Sn9BHR5b0t1VgApEDhdM/XLGmmaQY8uAFFw/lJZ07N+Ykfvo5GcsbNe1FEAf64Y
         9q4vBduXdhUXh+2qiRoQh33tm759PqTkDJ6UUjOuAPChfsIufMCy3zyj4Y7zuhA7WOF1
         LapPRG+uYdyVMvGJYS7T8XJxHqNTWNnH+J9KeJLZEtdDrZWUbKMURgvllWZLqbTWrB35
         fRZ3akxjV9ngw8A5jCbj/UHrX0/nGygQFD3d8FVHr+ci0lxEtCcXQJEL8IJrm1ch8FEh
         Tsng==
X-Forwarded-Encrypted: i=1; AJvYcCXU3FU4IHM2K8Py/4Dl0guI4KWb47xnaqUpJAWn/bGK/BWinX4+RMK4Q6i9LkGSLFIw1MN6pGkZQQjMAmkTJcRBb+iXhRNjEz7oI8ZOow==
X-Gm-Message-State: AOJu0YyQn1LW0luda3ZRKxPHlJJ+IuAPvJm522Lkxuzf5Ox98LlY+v2g
	cIxZJIrVH7d9eo9HL8YHoHoP3GOgoaw9d3H+h6l1xmKvCXxAvyCQ
X-Google-Smtp-Source: AGHT+IEBX4FYb4gOFGZPwQ743sNbT9oZl7lMS6oM4vUbM7iuca8bfrna2+jJ549qvM3NYZaT4J9nHA==
X-Received: by 2002:a17:902:7613:b0:1dc:63a0:8c6d with SMTP id k19-20020a170902761300b001dc63a08c6dmr9180109pll.40.1708998470559;
        Mon, 26 Feb 2024 17:47:50 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:50 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/10] ARM: dts: aspeed: Harma: Add ltc4286 device
Date: Tue, 27 Feb 2024 09:47:18 +0800
Message-Id: <20240227014719.3037588-10-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

Add ltc4286 device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 6e9e6e559838..7dd48c384a4d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -271,6 +271,13 @@ temperature-sensor@49 {
 		compatible = "ti,tmp75";
 		reg = <0x49>;
 	};
+
+	power-monitor@22 {
+		compatible = "lltc,ltc4286";
+		reg = <0x22>;
+		adi,vrange-low-enable;
+		shunt-resistor-micro-ohms = <500>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

