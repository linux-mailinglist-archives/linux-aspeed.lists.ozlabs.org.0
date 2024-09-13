Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9289779FE
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2024 09:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4mXQ5rxtz305G
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2024 17:44:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726213443;
	cv=none; b=XNeHsmEbHXGxUT6D5zhkJ8lOSnFFwp+HysWfSXvoN81L1u7s3sfED4tVnjqnD0SdKQ2cWTzxLw7MNJDZtIc4Wgg9jLu+XJjTieCtIdDPe4KbgxwltQFv77+PVTOdAoTSYcDoMbTHvfDTpF8ePK9fu76HwCE3bKt+mLJPzEeerH2yLi8lyjU9wob2ENU7DrhUvSux1Zm1CiRoOvBURsldupWBGmV7R40DOoqTqvzFO+FzvxqCUsuxjPEbxSPH0BjNBmN7QbI6qvVsoLhTRMazMw6NazH9Dyw1QEnKN2tmOFps97PV+8ZjkAKuAv7DNTKTX4F+gqmxDFuWvQp8KWWofA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726213443; c=relaxed/relaxed;
	bh=p0clfETra0/J1rvcdliG02l+DYE0Rpe1F8qNB82ANmo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QKkMsw+HrNaHzLkTsEQsUQgzrnucakyR4l0RYecAe+v/QyPiFqt8/peMLbiU7nok4fasyjg+aCqU7xmwjdAtI54wEIVlfenHWI8R1FA5jlNQHUFZ/f+9S906cUdi9chUdMl08aFLnxRBfHKIw4MAgWPivYamk9aU7FllVqmbfDBrmR+EJEeT08SK/kFaHA37rRKphS/VSfKc1i70dZLIV9xRfG4Hm6MfKdq9YQ6LtMbR6aXwp4ITgEMfydlLZ/y4srnNXIbREEYtB/76PEN8V4dJJn5k/HExi0sn7wEo9VIRVbo3IFlxsNkQ8yJIEs8sLkTtwfD3vtsHoUvIB7e98Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4mXM2N9Jz2yVD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Sep 2024 17:43:51 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 13 Sep
 2024 15:43:25 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 13 Sep 2024 15:43:25 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>
Subject: [PATCH v3 0/6] Add Aspeed G7 gpio support 
Date: Fri, 13 Sep 2024 15:43:19 +0800
Message-ID: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
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

The Aspeed 7th generation SoC features two GPIO controllers: one with 12
GPIO pins and another with 216 GPIO pins. The main difference from the
previous generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, direction, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for GPIO registers and the coprocessor request/release in
gpio-aspeed.c making it easier to extend the driver to support different
hardware register layouts.

Change since v2:
- Correct minItems for gpio-line names
- Remove the example for ast2700, because it’s the same as the AST2600
- Fix the sparse warning which is reported by the test robot
- Remove the version and use the match data to replace it.
- Add another two patches one for deferred probe one for flush write.

Changes since v1:
- Merge the gpio-aspeed-g7.c into the gpio-aspeed.c.
- Create the llops in gpio-aspeed.c for flexibility.

Billy Tsai (6):
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  gpio: aspeed: Support G7 Aspeed gpio controller
  gpio: aspeed: Change the macro to support deferred probe
  gpio: aspeed: Add the flush write to ensure the write complete.

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  19 +-
 drivers/gpio/gpio-aspeed.c                    | 498 +++++++++++-------
 2 files changed, 313 insertions(+), 204 deletions(-)

-- 
2.25.1

