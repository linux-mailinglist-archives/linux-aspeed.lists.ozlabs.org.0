Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532B95C5B7
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 08:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqrBN3N8Sz2yst
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 16:43:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724395416;
	cv=none; b=VL8E2sO5xV5PO4Y5gtPbaywhDLTgCAW6eHTQuAwKQW2LM02GUD9Vkru0yEiCqJJPmSLcF1y99gmOcs1OsvA9U07vTpBkxAti3v2a+2ZF723yBCEHFS1Z9T1bO9ID69OrqKZBbEsqPU0lXeEFQgMOHkZ7+bEcfCrawJyz/pA7Xh3gWj2uoSsmA/D7Ygse9d9xfAazejT/zzprBzPcaiKz+ZlcaS9ftUZ96GQ4KXC4uvpiUXpmA6mrOtBX9YYsUkiJog4oLOJa7xe/1naqPaouWUfIaio/9TIcTZkfE7WdWMXbUScxt4xLp4Na3pCitsdG+X91I24HI/j9+irFohmvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724395416; c=relaxed/relaxed;
	bh=NYOh/f+PKMG60Z8skNFtKlY3aoSCdSNzYowt/XP3s7A=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=QhgyALzJ90t7kt+iEaHsbLIXH6Jt9nA21MesU6tZanFvFPvkIjg1l2Bgp0s5jQ0QidM9/wQKDXd+kQneaYqXxV1Fpny6I+kBw7uBZ1cPFApd7n7jnxgWenzGKQqQ0jwTMSnKVtDswK9chOmQdoRns+wHGEHxIEpui6yHOWNW4P2oNKMQUeir+IX4vLoIo+MiCEkFUUWICMjngSfexopfAvyO4l8xG0rIC7vKGtWhxPQwplGnEEF6qRas+5zNnLMKQGRDapcBapsmai5zEc2qB9QPwLoXsesn/uaECy1FTflGS18Wnilmx/R8VWIXIvAb4gBm+c7V8cjXhzB7f9HqFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WZ/FaqKL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WZ/FaqKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqrBJ3kZ1z2yhM
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2024 16:43:36 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7106cf5771bso1433774b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724395414; x=1725000214; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYOh/f+PKMG60Z8skNFtKlY3aoSCdSNzYowt/XP3s7A=;
        b=WZ/FaqKLjWa5EsR9q12gzHZkBaXoT0TsWVvqcRcTYvvMNwKET8jwdk1XGnuaDras8l
         te6F9XjnFMT3QvXV4CXpAg9g0zVIHVggZWzXOgZo5qtM3GYxY67aa8bVJSlkvUgfH6No
         gGLKWNnUKEJSDipRoH6hVMAniyH+5hJgy0pUVF4kAwFCtU3x10leZdATVyT+4B0Py/IO
         d5pBhZZcoVhdGgRuOL7QfYgct+FsDzDFA2CUMLjSo8qZsWcTssCm3aRo9t0hm5tKqR39
         0R8XjTI17w+QVc7JUemlMyjTPnIyVmeZlew9Bt8VnvbXIUKsRFyt4E0F8d54LAJHH3Xs
         Ftyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724395414; x=1725000214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYOh/f+PKMG60Z8skNFtKlY3aoSCdSNzYowt/XP3s7A=;
        b=lxvJKuoSaf2jDQDJ4+BFjyEzRcqgYIEtL+UKOsEKn+HyH+wB4T2wsoPnajkG17C9Nx
         mweplSbNPyhXGQFOLKCmU4uAoySykReoZxIaWEEAibuQbNkMWhBFV/wuiPvZ8ExE7Ag1
         Y40Xb8OJt4OIQvrVBmti8Uip9BkU2gWI0cKFsjPrypXrTq4crX+teawa3sUojuQzukmW
         1RVlxSTdtoLvrtyzlESrEHZTUvzGRLI2rTlMimoui05u6SL6WM5ySPTdXvkLQijYpYAZ
         SZ0+z/Uar67Z3kxGHiHIdQKS+JxEjmyICrmlvRlDkDjg1iR6E0fY3nluXy2jy3/DGRzO
         c2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWBniK8GDKDdFHLvWu+CIBzmFsupST/erOOkXp28hlH9ZVBFeaahOrKh5lx+vCBITtkfdWyiI/2Ym5rEw0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6GNSFXr3ciV47igjDoDS1Ow2fBGswKtxD6mEZh4KudwbVk7Kp
	4wXwBDblpGS+zcPYvOJVgoFF2LreCmeIXdd4x/yz8/2h0rByUaKL
X-Google-Smtp-Source: AGHT+IGlBZYDSqKBx7X1Mk43LIUY+lx64RE6npOl/5VVD27Pa2wZ0FJ9ehRRbEHdmBkFN3jhNBCJ1A==
X-Received: by 2002:a05:6a21:648b:b0:1c3:ea28:3c0e with SMTP id adf61e73a8af0-1cc8a219ff8mr1663209637.33.1724395414091;
        Thu, 22 Aug 2024 23:43:34 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385565468sm22339945ad.11.2024.08.22.23.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 23:43:33 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 23 Aug 2024 14:41:11 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: catalina: update io_expander7 &
 io_expander8 line name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-catalina-ioexp-update-v1-2-4bfd8dad819c@gmail.com>
References: <20240823-catalina-ioexp-update-v1-0-4bfd8dad819c@gmail.com>
In-Reply-To: <20240823-catalina-ioexp-update-v1-0-4bfd8dad819c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724395406; l=1175;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=lYDLdUYCrwY6a5mhCSzWWqlmyXeb1cIG1mcHjoTXl7Q=;
 b=oHa/a+5k0qYnt5eQi/NyV+gpqBLSkMV2yxTRp0mT7pJWN3Zb+iBz0wLKCBsEJubzC8SNYExBi
 VD2c4DsfhCgC0/oze2kJY6QlG1hQhr1+4i6WFBYQ2sQP1YPrr2qj7BD
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

io_expander7
- P1-5: MCU_GPIO
- P1-6: MCU_RST_N
- P1-7: MCU_RECOVERY_N

io_expander8
- P1-5: SEC_MCU_GPIO
- P1-6: SEC_MCU_RST_N
- P1-7: SEC_MCU_RECOVERY_N

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 3a00182084a5..82835e96317d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -1024,7 +1024,7 @@ &io_expander7 {
 		"CX_TWARN_CX0_L","CX_TWARN_CX1_L",
 		"CX_OVT_SHDN_CX0","CX_OVT_SHDN_CX1",
 		"FNP_L_CX0","FNP_L_CX1",
-		"","","","";
+		"","MCU_GPIO","MCU_RST_N","MCU_RECOVERY_N";
 };
 
 &io_expander8 {
@@ -1035,7 +1035,7 @@ &io_expander8 {
 		"SEC_CX_TWARN_CX0_L","SEC_CX_TWARN_CX1_L",
 		"SEC_CX_OVT_SHDN_CX0","SEC_CX_OVT_SHDN_CX1",
 		"SEC_FNP_L_CX0","SEC_FNP_L_CX1",
-		"","","","";
+		"","SEC_MCU_GPIO","SEC_MCU_RST_N","SEC_MCU_RECOVERY_N";
 };
 
 &io_expander9 {

-- 
2.31.1

