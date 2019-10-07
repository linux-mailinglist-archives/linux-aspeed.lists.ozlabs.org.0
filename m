Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151AD0795
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:45:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4Tb5nsxzDqLp
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:45:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.208.51; helo=mail-ed1-f51.google.com;
 envelope-from=wens213@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csie.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46mtVm6vkzzDqKb
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2019 19:11:57 +1100 (AEDT)
Received: by mail-ed1-f51.google.com with SMTP id f20so11513160edv.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Oct 2019 01:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Snb3N5jBGTny2lV0Bq/REXN2i4LAg5y7Btj+sL3kJn0=;
 b=bYmythrdPtkR6qYRBzEHaoHhBTw/KWx3fyAmiAglMteHywovTvvKdGjYHNl72JufVH
 AzbQLfXz6poBA/R3LRS2LIKNamV1RHIdssvSd3rUAjUiNjvUqSjqqYHFLV9dM2/WECB+
 SFU4J0Fw4QwyKfTymdJrfNis1oR9uPdLrT/9LXRWJ5ScHsYr+eU7f5vOChKcFym0pfja
 ALVSRb2II2CiaiqTGCrcQurgf1C8+9tqaBcpyXbC7KkDflOVFRMc+dabwc6ZKoArjqgW
 yoPdVDvsdfIV6ckTO8wgqDsKOv2alrZyAF3BzR8BISlIO3Bi9Y1lTST78sI53iWcaLwQ
 sVWg==
X-Gm-Message-State: APjAAAX+lU+Z17V/yYb8y5lOkfKSaukIi+3flFWFOR2h2UwoddadlI95
 paovi7YyHfShI5SBpff5FWB09c/WWjw=
X-Google-Smtp-Source: APXvYqwQxDxaH3rmU+jTRzHh9dlHLRxAsBA5+klJmNG8aG2k/uMlZYmqLGzBihv+xmOSFHWUs9R1hw==
X-Received: by 2002:a17:906:cc9b:: with SMTP id
 oq27mr22635816ejb.125.1570435913402; 
 Mon, 07 Oct 2019 01:11:53 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id e5sm3271460edl.8.2019.10.07.01.11.50
 for <linux-aspeed@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 01:11:53 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id h4so5306593wrv.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Oct 2019 01:11:50 -0700 (PDT)
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr16979718wrr.23.1570435909394; 
 Mon, 07 Oct 2019 01:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-30-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-30-yuehaibing@huawei.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Oct 2019 16:11:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
Subject: Re: [PATCH -next 29/34] rtc: sunxi: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:40 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Baruch Siach <baruch@tkos.co.il>, Patrice Chotard <patrice.chotard@st.com>,
 paul@crapouillou.net, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, jonathanh@nvidia.com,
 ludovic.desroches@microchip.com,
 "open list:BROADCOM BCM281XX..." <bcm-kernel-feedback-list@broadcom.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 gregory.0xf0@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 eddie.huang@mediatek.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Oct 6, 2019 at 6:39 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
