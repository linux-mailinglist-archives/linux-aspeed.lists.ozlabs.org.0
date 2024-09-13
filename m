Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D02C977A04
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2024 09:44:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4mXT6xYXz303N
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2024 17:44:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726213445;
	cv=none; b=e46wsgnC5CgT33R2moEn+7mEeD1y2jNLj+d3CfDZ8Fjuec7kq+NYezwFVQokAY21/ENevFeJdiqMeidYmMPPuYDlM6QekThryHmCrrRj1iwaDjtINYTbbwETskhvhljRswzRhODrHR6YbcYvWsB7QsfDIk2v6nkUgMgsxyr3Kav+/9knFXEooibx1m7pl1jL6xTfiO8r9M26LxGlUNfk5Bm5naFmY7MKaqn4MvlBnZJXgfpxFCD6aFsphaqZN67XKcBlSETNU5Hw21hyDdoqJ4LEeE4mr1mRVjHXNQvgjOxYFwzATX8zzmPYfOB5EltOnS354kV4013UqIzWGO4hyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726213445; c=relaxed/relaxed;
	bh=sljtKxXeVQPVNfmwe1wElLj+VrMT3o9OsMqaAzMQKoA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lsNMnQiB3Q/4vEXyA0yK2hc/mnOK0+AxewV1JHkdoSyzkj0QMSauoHRw37DHm4Bg/VTdy2KDfgsTvwa0h8BCd4nI5D49VW+Yprh4Gt09lz4Z/V/ZqF/SWMaVnBpFWROy+7uTrmLoMVaBDvb+f2k/5QkiHWKP3Zg4JCG7CoGVGDB4+dy0C4IVnucYF5YukrwYhro4c6ddhOKxdh1ddy8gdL21DSOQq0q8KnAgiImgDVoNChRFO4DMF5nyKmHUpIjYlCM6acpgKkLH5yi2KCfsFZ37414Qcmo22FIZCDjJvwE4RiVQSH8+eKvyFwzSt9514TUAAmt1D++CKAg5jphLIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4mXN6bPfz2yVD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Sep 2024 17:44:04 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 13 Sep
 2024 15:43:26 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 13 Sep 2024 15:43:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>
Subject: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the write complete.
Date: Fri, 13 Sep 2024 15:43:25 +0800
Message-ID: <20240913074325.239390-7-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
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

Performing a dummy read ensures that the register write operation is fully
completed, mitigating any potential bus delays that could otherwise impact
the frequency of bitbang usage. E.g., if the JTAG application uses GPIO to
control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
sets the TCK clock to 1 MHz, the GPIO’s high/low transitions will rely on
a delay function to ensure the clock frequency does not exceed 1 MHz.
However, this can lead to rapid toggling of the GPIO because the write
operation is POSTed and does not wait for a bus acknowledgment.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index d322c03481a8..d1e61ee48da2 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -406,6 +406,8 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	gpio->dcache[GPIO_BANK(offset)] = reg;
 
 	gpio->config->llops->reg_bits_set(gpio, offset, reg_val, val);
+	// flush write
+	gpio->config->llops->reg_bits_read(gpio, offset, reg_val);
 }
 
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-- 
2.25.1

