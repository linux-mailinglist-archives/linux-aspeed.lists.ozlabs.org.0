Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96D9655C5
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 05:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3q52MGWz306G
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 13:41:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989291;
	cv=none; b=JAfdClIUasXnxkZxDhaB1MBzyiiXRt7znBIigxX35S2iP33WR6jAYOJR7gE8hpudbYxcZZEaIszD4zaQXIIMoUNORAigI3j6IwZ6UamEBIHn8uBZHuFijs8VMty3aZKSn03PkhCVQRfqJ81qAaFIZEjTcKVXyvJ7CD6reIz5BerY5fvdA7bAkes0YYrbZd853OpAf3Z/vE67zaMhAnooH9cH2JuMAoMLXVDHGgfTIQddsjDkpBMd5NIjKsbz86eDbT7okPP5jYVoXtLu8uI0i/6vJjXwaHSsSU8g5t0ZaExL5RtNA23B2PKfVD6gDGR/QLTmsGbG1Nfr+I8tWqpe+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989291; c=relaxed/relaxed;
	bh=RV18HtrPli2WZck8lr/K+3rLdixP6ndlf86GWE3vpSE=;
	h=Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type; b=Tz6h769XRxH5GgjSac/Gps1xE9QSUopswyTIODPqS9tyKiKLMhlBIP2HqHJLFFzUTBH4JBQv6vW1alNCOxTLlRUL/F+MilwvvLQSBGkvGhleyRpeDD5UXiHIVNjUZhPR8/5MG8z41rtN7foK9Gzzlh8rNSt26c5HH7jS5/nBV/OHKWNkiAYreiM81L7TJAiT4xke5QNlAWxQG5pLyV+Oi9WZ0pc0Rlr0CravEHo3DDBAJAGrYlLgfQeqa/LxGpCTO0K45RCRZu6CqdktneI4cELUGC9ESYAEBgd27kg2h/SedKP9VBMFB3LQqhklV3uHGtwwLqWQ4A+0IDX2ICdxPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3pv4qSVz2ytl
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 13:41:12 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 30 Aug
 2024 11:40:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 30 Aug 2024 11:40:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/4] Add Aspeed G7 gpio support 
Date: Fri, 30 Aug 2024 11:40:43 +0800
Message-ID: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

The Aspeed 7th generation SoC features two GPIO controllers: one with 12
GPIO pins and another with 216 GPIO pins. The main difference from the
previous generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, direction, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for GPIO registers and the coprocessor request/release in
gpio-aspeed.c making it easier to extend the driver to support different
hardware register layouts.

Changes since v1:
- Merge the gpio-aspeed-g7.c into the gpio-aspeed.c.
- Create the llops in gpio-aspeed.c for flexibility.

Billy Tsai (4):
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  gpio: aspeed: Support G7 Aspeed gpio controller

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  46 +-
 drivers/gpio/gpio-aspeed.c                    | 442 ++++++++++--------
 2 files changed, 303 insertions(+), 185 deletions(-)

-- 
2.25.1

