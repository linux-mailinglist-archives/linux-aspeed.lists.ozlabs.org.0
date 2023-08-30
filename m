Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE3F78D477
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 11:04:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LsLQ4m3k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbJJh3gnFz3bpp
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 19:04:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LsLQ4m3k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbJJY14ryz2yPq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 19:04:27 +1000 (AEST)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-48d0e739e32so2325992e0c.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693386262; x=1693991062; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zRFnOrEZvLN5kMlEOUmKO68YNnlEwR47/rOgrclL5cI=;
        b=LsLQ4m3kut1Mlai6pu8skORpIPEfZMMZKxHirG85Fv1VTyl//+2rcI9Bj2aUcjM68w
         TLrco3nn/t5bdsOQBM0idoe7ZwPdf9cyB60RrLdiql52iz1weSFkYE2ZLRkMU57TNb+h
         y9koc61QR1hZvYpThT2G8TlQCMx8uF1n3R/Nlmqy8aQ4NjIGNV1I0IPYGvDZmPq982sV
         I7gcMJIpz31rYmNPpv8hbp78ozLKMeSHAN62nDWoIR8M5+Q2I6FNRNhpjlCaTBwYv7lm
         443VKj+1De+xHSztDMHFm6SQ/D8QUzo5bnIxsxhR09vjO4/PyAgYGWwSgsJqRFm7rFn+
         zQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693386262; x=1693991062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRFnOrEZvLN5kMlEOUmKO68YNnlEwR47/rOgrclL5cI=;
        b=dhYdnI0L4G8i5CI0XRPHFYgZiXZLKuuY0hPtdsjGTOjej0DuSd1YJBtqnxpJ9wEXlE
         3fi8k+yBTzfsK9snkwb9qShPaMImvNh/3onlYAyi61yhAwSTxHJiDxefmxGv1vt7+qSj
         1CGUnLsrxgn9wTrdjPjnjYyPb/5Ub9pv6dUhLFyXDsR3KrvinJ3WR1hoRboOummKVuqm
         w9mlkAvadQU7HmdDv3K4jqwAoRgq2TyHQQMpjafFfp+opfHFObpqxTH3ufzMhbLyleRp
         T5Zdajg/rSaXNBbyk+jne0bd9eeMA0fOVW9MNAM8aXUxfLbMZJfawK63t7jYmp+mZLNc
         ynmg==
X-Gm-Message-State: AOJu0Yz0XIVDjlZR+xINvA5aNwVrs6qx6JLBvwg9bpBbvwXCykD0pv74
	wGQKg8wxr/6Jhk210ujp4g4=
X-Google-Smtp-Source: AGHT+IFRF/QDUiw8HkrwOVzahLlEG5guebup/jA0oCLgscvJyaeOR/MUVQPM2c8W1nVG0Tzyudffzw==
X-Received: by 2002:a1f:4a02:0:b0:48d:4b:66df with SMTP id x2-20020a1f4a02000000b0048d004b66dfmr1520456vka.0.1693386262097;
        Wed, 30 Aug 2023 02:04:22 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x4-20020a656aa4000000b00553dcfc2179sm9263226pgu.52.2023.08.30.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:04:21 -0700 (PDT)
From: peteryin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ARM: dts: aspeed:Minerva:
Date: Wed, 30 Aug 2023 17:02:09 +0800
Message-Id: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com, peteryin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 line : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/

Change log:

v4:
    1.seprate dts document.

v3:
    1.Fixed commit description.
    2.Add sgpio line name to sgpioP.
    3.Add ipmb debug card bus.

v2:
    1.Add facebook,minerva-bmc in aspeed.yaml
    2.Use stdout-path
    3.Add Makefile

v1:
    1. Create minerva dts file.

*** BLURB HERE ***

peteryin (2):
  ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
  dt-bindings: arm: aspeed: add Meta Minerva board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
 3 files changed, 387 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts

-- 
2.25.1

