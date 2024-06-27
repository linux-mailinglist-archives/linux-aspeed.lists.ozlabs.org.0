Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC830919FCF
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uik1+kRi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qGs23wDz3cVq
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:01:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uik1+kRi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qGD0RRgz3c2t
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:35 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7067108f2cdso3953483b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471635; x=1720076435; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i53cLyoOWskUbqWkTIcWB8akUWR3OQ8O+64UE165czU=;
        b=Uik1+kRi9b6koWsIXhJdY5vN8mLQ+7JVXX2JSF9+WXmLpHFRppOKEb5T8ylfv/Aj80
         ii/zJMfO7EQj46vQpGlQ0y+42kcAyc6fJq7Y2qQErYPZSOQoDVCD31pTMClNxKZUW35i
         peIJzvlH3sEBL/QpBVBCPZxDGkrabgGoGixxtqxIzSnrQSDvIq4yvpaA6jyC7ULjvPNr
         S4ZDxHnf6XqmjJ7P4mXHO6uJmn+x+D50GapA1h2aFsMpIJ6JON0Odwq+sKfFw8KZmHFn
         IsHAgUzZqwh304GocuVViXkQ+y2zcLyWTSs43Z2eEqANpgpPN58u6QWTJlGa9sg9IpcS
         IEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471635; x=1720076435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i53cLyoOWskUbqWkTIcWB8akUWR3OQ8O+64UE165czU=;
        b=LBpm1Z/40zNJh+UVplr4pfYQ1a6A2o8FOTaE5NyTBy+iAznKBpTYwWCFCLldHbYyDN
         A1qX1I05PIyZjhR05xZ50fwYzU8tskTidlhpJrGbdFngHVaBXL0FpUedkXI7j/hDQDmc
         +8kVlPz6XIFH4y1MHzH9YEXK/4pbhx6sLPJhnOw8DbQV6YOJS6Eo1Kty93RFhPHI4+jg
         Nxc6jKDRTGmZ1WsW8+GgPsILctUsCNlPpFy85+yzlzKdYM+20UOgpMJSd0FpFryaGYu4
         vPwgI8sE8+uwXrAwxLUen18KAuiLYywGaD/MENClvE1fjxj6IGFK0Km4aPXQWtRr9rOF
         PoeA==
X-Forwarded-Encrypted: i=1; AJvYcCVF10IRH+GUW+AGcQMk0AzbfCgML7QEaPyh+cuUsHKgyfaYRVQR7iDBFL7NuowcA6bf1UgomwsQnKRJV23r4PgdcvK2E7eJHoz0u6oM9w==
X-Gm-Message-State: AOJu0YxLKxhQ0Cy5paQMFy9c+ZiB/xbCxTcIbQofYa2mlGlWWVU3IKoa
	+ZASoumNUmh65rS80JNJTJc/8hWltJRKdWexmBoR/jNW1J3iVvEP
X-Google-Smtp-Source: AGHT+IGQP12PAiVlcbL6uPoDRoBa8b7kEnCv6Dx8RcyZU3Of7JGT/laCF7tyJWI2YkxI7D17OHIuhA==
X-Received: by 2002:a05:6a21:32aa:b0:1be:c2f4:2e3f with SMTP id adf61e73a8af0-1becda4aa27mr1438583637.56.1719471634740;
        Thu, 27 Jun 2024 00:00:34 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] ARM: dts: aspeed: Harma: add power monitor xdp710
Date: Thu, 27 Jun 2024 15:00:07 +0800
Message-Id: <20240627070013.2509150-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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
index 7d809f1636d6..77eaa89b5eb5 100644
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

