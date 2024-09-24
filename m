Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C7B984735
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 16:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XChSF0QQFz2yVj
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 00:04:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727186666;
	cv=none; b=fXDA27S7WT0XMiI2c7Ju3XKwASB8baqDzrdCFsot/KkcXcrgb5kQs+4Alf7TL3r4mnisMhRejk2gpV29Sadtd2c8zwdETIY1/ASDTJe9gYNlsYfUvsAV4GvUfpkA3rE36jLhs0HuOLofJErDeAcm9nckTRsrPjmQF/JAZlfuERckyqfCLkasFEOoAttdBA7i4CXqhkl90jBS26TymLQNqpVsWmfqC7oM8uIe47WpzrC9MpILB1dXPeRFqjzppldzfC+WT6JSWR/x33qal97BvBnPt0pi4S/iytv8Z5MzcQ5pwIURx7RpeQULOl+Xs6Ym1jK4eBodMZ2f6VZ2l9o6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727186666; c=relaxed/relaxed;
	bh=kSNFlzqvdmMLt/lyyVwRlK9XJtljWCBUosXtsRFWcHY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ma5tDhuOdJJw2rJ8Oq6a8nEUI9QADzrC/KG6aywmmFq0W1JL/yU6T7H1/IPPeAIeAU9DVgz2fo6XO7Rzljz5NjxVIi1de47fxUQpNg6F+hSq1KacJkVom/BcuCw7U9MSfiMMeTdKQ6O79jfjgmdlh1OxtwyagfZV8KbbTstQGv6WLLQoQD/kcgVjOorb16xpYu8Fxnem6or/bqps/H8GRQbZI9yfsfAi51rMZRpqVE7rPZsVSEGNdTrgmxzb/g6EFw/cLSZuNyjp/NYsJ0CP60+GOa3IegGhmU8xi2mlkdSKNVIRRgmFqJtG69HA9CFS/XYlyzvPKSiq4Gz7uaCIsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j8C2BV6g; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j8C2BV6g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XChSB2kLpz2xdY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 00:04:24 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2053616fa36so67432785ad.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727186661; x=1727791461; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSNFlzqvdmMLt/lyyVwRlK9XJtljWCBUosXtsRFWcHY=;
        b=j8C2BV6gzhsw7ehiYOnURJEyrfpa9nZO0EyrVaz7bGC64+kvJbMdIniU5m34X3tqPr
         WthDZc0TVJRaIeTLeYEgD27RPsZGtDIYFAePMh6gE0sfq1bj6xuGkhTluZbhqeO2yI/P
         zt0nQQBkmbmgrM6o1f0WtuyEdZeRhKwU1DcRF0gx6q4FBDjJF9DtxkDY75zeM8l7JvBh
         unY/XgOrzQOE1zVXGIxAZnXreg8T6npE9LISQMNR4JeJeXJOXv5nVYdQTVHjtB687sy8
         Uv5WcTqReBBFJROt1vjmXC1lZWaAgwj5/ue0DgA0HQ+CBN4k2y+YH66JWOgLfipwSG60
         k26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186661; x=1727791461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSNFlzqvdmMLt/lyyVwRlK9XJtljWCBUosXtsRFWcHY=;
        b=R3VcYBmYJ43PNif6E9qeGMZOnUgU+jjzLKCoykqL+/JDXJymxeGSHX3vjJXUUGKqP5
         nFs2SDpLh8Pjf8vwjA0XQRX2KUfUsjNd5nUWFduAgazfSfINWPCZLSs8Uq2i1WPobICg
         tSXyPue6ZOXU/iWu2gW//8OA3Rm9NrbmKHcsCW8oBN7KaJC3u+rXjJWfYOY4xXvlz9yo
         TrxXnFtNEdtw6LOXisNBj8tvMygW40zLB3K6gLiKXNcuHv9G+N7IAeailsAw/ahIcv1D
         ZDjo14dJdkT8sdSemqOiueEcTWyrrmYqDlJqqIU5MjTl+3jgXB8Y6GYcN/uiZFnkM2lq
         a/FA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6hVkD/CrgAPrvxnskN7n8ypWwz3dR1L2n1USFOYePP28d5/tWorcucePU7CRDoMVmSttIcOD0WuefwE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyeAgdBSEJAdFnwN7fKBJLabGnaPDrMFZB9gxHcwa8JVhvK/n4M
	u813A4lwQTKoHmaZ8OQsY0Xb9tgl5nAXcy8eEl0jpRq4us8sCXdD
X-Google-Smtp-Source: AGHT+IEKMCsX0ABsD3AmmZlodbc9JPGxroM9vSs3FOpEGLY+setfBLhzmzbZ6NHxMEM8yQlTxRiaPA==
X-Received: by 2002:a17:902:b489:b0:207:5d33:a1b8 with SMTP id d9443c01a7336-208d8408255mr191740725ad.38.1727186661244;
        Tue, 24 Sep 2024 07:04:21 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1821f33sm10678895ad.219.2024.09.24.07.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:04:20 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz,
	amithash@meta.com
Subject: [PATCH v1 0/3] Revise Meta (Facebook) Minerva BMC (AST2600)
Date: Tue, 24 Sep 2024 22:02:12 +0800
Message-Id: <20240924140215.2484170-1-yangchen.openbmc@gmail.com>
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

Revise linux device tree entry related to Meta (Facebook) Minerva specific
devices connected to BMC (AST2600) SoC.

Yang Chen (3):
  ARM: dts: aspeed: minerva: Revise the SGPIO line name
  ARM: dts: aspeed: minerva: change the i2c mux number for FCBs
  ARM: dts: aspeed: minerva: add fru device for other blades

 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 475 +++++++++++++++---
 1 file changed, 405 insertions(+), 70 deletions(-)

-- 
2.34.1

