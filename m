Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC8689766
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 11:59:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7XjR0J0Qz3f6L
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 21:59:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=RYnORqcu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=RYnORqcu;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7XjH1gQ9z3f5s
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Feb 2023 21:59:31 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id CF2E13C4;
	Fri,  3 Feb 2023 02:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1675421655;
	bh=Ch3jIrqzLLO1RgMMeN6WVOGy2TVSQx5KsM9SaZGkzB0=;
	h=From:To:Cc:Subject:Date:From;
	b=RYnORqcuYn2xQA6rNMqf2uDffWYNIB5eOt4Pb8fBD+9LtPs2UvlqoPHkCqMBoqI+3
	 JPpRuy9y87ijlkKMD+ywMS0yPZikDEYYgfjaEH9KANtxVc2S9+xOizDJbxlEtOuzU4
	 vKPy0dX/X4XDhIKCPmpmQ/8cVEmVNKHXW9EdadwU=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] ARM: dts: aspeed: ASRock BMC updates
Date: Fri,  3 Feb 2023 02:54:03 -0800
Message-Id: <20230203105405.21942-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.39.1
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This patch series contains two small device-tree updates for ASRock
BMCs -- an LED polarity fix for romed8hm3, and enabling the ast2500
PECI device on e3c246d4i.


Thanks,
Zev


Zev Weiss (2):
  ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
  ARM: dts: aspeed: e3c246d4i: Add PECI device

 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.39.1.236.ga8a28b9eace8

