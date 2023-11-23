Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C27F57A2
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Nov 2023 06:06:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QXCry4SH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbR0q3Y4fz3d9v
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Nov 2023 16:06:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QXCry4SH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbR0j0FGPz3cVP
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Nov 2023 16:06:27 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6be0277c05bso518493b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 21:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700715980; x=1701320780; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMW4mDDc36Ycbn4eYhGyohVNo21MBd8auvFksF2JVBY=;
        b=QXCry4SH0rFJlDE2mJG8sIPQmLByuS5qeZzWTN8uSEKgujmrfkhqcbCp7rsu6icWc/
         GLgKplqSSpAM8hzr2aJWnbTjV6rvTPzvv/lrOSwrW7+AiMiWMBizpgVv+WCf+Og7+vUC
         M5Xcofc+trxZZiJYW/PAThDemL9rdjw/MwfDf/gX3jHAwSFygjuqxaF1DhQIOnoIHJVR
         w1pVpaHt+TkwbepF+zybkIUQQBKcBckVzrYSaWLZe4oM4oRX3QP68tFjrF4AJj0y/j2y
         gRWDocEMyAY6rzS+FKyM4lOzJRyvHd5gAfyiy9dvPiEZSgi1fRcDKfTWQeqclO6Ys+CA
         8q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700715980; x=1701320780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMW4mDDc36Ycbn4eYhGyohVNo21MBd8auvFksF2JVBY=;
        b=Gm7Eue9SWw7GhJiyw627wNIHIRzHRmrCQAIq8bf0RxGqcWPRamZfULHdXMRGlhnDPU
         goUO1emDZKSwC28EGYEyguefU/At5MSYfhLjk7i4CyUVY2CRwgfdTCRv7bejwG901PcF
         WmPhnh8BCcQbZAvWT93DA5SC3EqTMI/e2NQRYkWiEuOwNJDnDRyTFtO0EYOIv1rmYzah
         +Brrnmg9Thig48eIn1WIGVBP7QgcFzox3KsUw826VlcbTPKlFk0qTru8lqOPXS8Cpx1M
         72QijMXdfHKrx6gwAqUi0D+OWOnskLT+b30kpRwtMiNe/La9mUBY3nt5cVakKoYqaUvh
         lqgA==
X-Gm-Message-State: AOJu0Yxiqu0MjgVL10P07tZBGosmLrDXM63XgLti2BACKosBz++Jh9ty
	/PKGdLIOJnLjunybYHrYW6M=
X-Google-Smtp-Source: AGHT+IFRZm7OT99klO8l5KWL9WVUjRY72ymYXHOYAATXOxuSHFJ1U6TCiYBLi1g6hUwVd2IOYW2i6Q==
X-Received: by 2002:a05:6a20:841b:b0:18b:8dfa:8946 with SMTP id c27-20020a056a20841b00b0018b8dfa8946mr1325340pzd.13.1700715979742;
        Wed, 22 Nov 2023 21:06:19 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a1a0400b0027b168cb011sm413101pjk.56.2023.11.22.21.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 21:06:19 -0800 (PST)
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
Subject: [PATCH v3 0/2] Add Facebook Minerva Harma (AST2600) BMC
Date: Thu, 23 Nov 2023 13:04:13 +0800
Message-Id: <20231123050415.3441429-1-peteryin.openbmc@gmail.com>
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
v2 -> v3:
  - Fixed led schema
  - Fixed i2c mux schema
  - Add BMC_READY and SGPIO_READY

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

