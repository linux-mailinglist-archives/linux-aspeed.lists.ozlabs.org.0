Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B01DF7F3C5C
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Nov 2023 04:24:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QfB8RZyK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZmnx4BSqz3bYx
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Nov 2023 14:24:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QfB8RZyK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZmnm0Wd3z3c82
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 14:24:42 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6bee11456baso5591285b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Nov 2023 19:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700623478; x=1701228278; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwnN5Mp60GbUqaJnJtdiPEfokf2xhEImDf6jAe/ZdME=;
        b=QfB8RZyK0MwnGncrL6Osv2KRwdUDa+Yg7LCdvR7VIdSaL2LlsIOFoen9G/5u2Fmlgl
         7YXcMUhGzm2yNuGw1hMvIKiekWLuC+FHBZO/dpGDFsFPlnO25V20gEWAzrFGKSiAYXNx
         OEKnfSPOqAnIN+m1B75LlVjDDEXscrEJU3Ea0aoIyf8CylGS6bPxZAQcmQBrc5fGxcaU
         czA1myc7wFgs2xyqgPEF9sdSsUeq678Y1uZBvoorwUuReyI5vLreGJzd1GpIsdECK8jI
         UmDfqLHq9aNC9elw0kT6916ZEgymO8erxbYlBRmSxm7BAYr+G1IAvnHG9iS/vfj7UGV1
         rq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700623478; x=1701228278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwnN5Mp60GbUqaJnJtdiPEfokf2xhEImDf6jAe/ZdME=;
        b=sELe9pMZYuYZHAbM0DU4D21VFLuntLtGabcqs63cXclLMuFQRtB+IHvwz5vxMvqjQv
         2zku9IH0TsJnfLLm1AyjFpRFsvmn0+/4wpCqfmHeqMONACENYnHJOIB1jSv0sir6cbqo
         IBE+T4zUTRMlma/f90HFY7TLhtu2CiQSyUMY9VOnuP49+4ZS85db6QNgwpshSQJqlJsd
         nsIoJEkDREdx8JmhZ6cEtL41p1n0d94FwT8YoSpFD0zeTRl9QoCrvJg5WuAnVYq+3V6A
         PPgjidtuXanjP1WT0JEjSBhJtV2HrIxMKnHJhFGikEytwOU0cESMscpm8hYguK6v5qla
         XP2w==
X-Gm-Message-State: AOJu0YwS3K1vRJt2NGSYRmDpiPwpUlhXbBXdh6S3Uz75Y6Y8sQDjY/VH
	4/cUm4gJCerB5a9+iWWbA/ZrBDnqVhM=
X-Google-Smtp-Source: AGHT+IFdDj8vN1C0M9rSgwZNk2buw3bn5CSJsGVqk6RpbHp0er3n8pMZyxFxiWR+rsYryxYnT5HX/A==
X-Received: by 2002:a05:6a00:3a1d:b0:6cb:a1fe:18c0 with SMTP id fj29-20020a056a003a1d00b006cba1fe18c0mr1274579pfb.8.1700623478416;
        Tue, 21 Nov 2023 19:24:38 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id s4-20020a056a00194400b0069323619f69sm8820110pfk.143.2023.11.21.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:24:38 -0800 (PST)
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
Subject: [PATCH v2 0/2] Add Facebook Minerva Harma (AST2600) BMC
Date: Wed, 22 Nov 2023 11:22:32 +0800
Message-Id: <20231122032234.744144-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Add linux device tree entry related to Minerva Harma
specific devices connected to BMC SoC.

Change log
v1 -> v2:
  - Add Power sensors
  - Modify ehci number
  - Add Led
  - Modify SGPIO line-name
v1:
  - Create minerva harma dts file.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Peter Yin (2):
  dt-bindings: arm: aspeed: add Meta Minerva Harma board
  ARM: dts: aspeed: Minerva Harma: Add Facebook Minerva Harma (AST2600)
    BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-minerva-harma.dts     | 533 ++++++++++++++++++
 3 files changed, 535 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-harma.dts

-- 
2.25.1

