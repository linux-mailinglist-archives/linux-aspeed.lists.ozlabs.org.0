Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA17D0798
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:45:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4Ts3jgBzDqLK
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:45:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=googlemail.com
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=martin.blumenstingl@googlemail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.b="ldZWZLPY"; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nBFc3GzTzDqLP
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 07:01:36 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id t84so12782777oih.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Oct 2019 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
 b=ldZWZLPYdSK/lW58g3GggUrvVCJd1bSherkZ3i1sSTYmEWn8xkwIcVHcmZ3icueHQp
 oy5jhaY7EWxyWVR9117SxscpYTuLMHxESfnKRG8OiuTaUqvhUU6ovZmkM9O2vxxFt+eU
 j1Ahl1lPiieioT2lbA364gHNXQWxIF0DgKTKQLSIoQ9sNQu3MyZJlIheMi1AbflSbGt4
 FMBBws1iMdul9gqqFEcvBoTYYrPIjtJ8f054Son5rjx4xSysmRjtnZZEtvqD1noCgWOm
 IoXuRgR8rfAJ12qdkaYZR+biJvf7tEDnz8LaI7EH80M+v2A1gn7VKk1h0BWgQr+cPfKB
 CGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
 b=rRRroHQ17ZxZTyXEmZcWJh5+OeZxpwEH7a1oRDFgA5rNmZRlSdgWBnloEfN8wmHee3
 HoeYTR3TelE5cB+Ao6VJ+tYYPswjoZ0XQNr0oQNm3KhSKIFKmaQwcpt0U1EkqjXwPHWE
 Nd/R/hGF/LzmMylbomUa0ZecGFR+x/2OR7S2ck2c3YH1LoiNuk+2dep9fV/goMpdmGjm
 o9WZWHjfrR5S/DtNcn/KHf+/d2Rg5XSVDsdnx4gAUVhIaYe3SpLvTFrh0vWrzlJzd1uW
 WHjMqvu36o2V+r/Ee46ovFbwn5MW3WIpr4xJ8f5wAYB4BzsWJuBNFaoSFH8f06jKt17O
 Y1/Q==
X-Gm-Message-State: APjAAAV57SRGPhe4vPsVAhxi76vnF0AeUgTfzyk7j5h7HezmDeWd5Kyw
 VkgPafBnjprux4hKiJ0XtKILclZM+8a+z2YzxUc=
X-Google-Smtp-Source: APXvYqxw4MwTHhEk1nJATSbu3GLXbTfDZIxzJF0EPb2WPk2JVoRBmvrn3TlNb7LKr7TGaqwsqjCfogj/ATlyGhjt7wk=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr851452oig.129.1570478492843; 
 Mon, 07 Oct 2019 13:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-17-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-17-yuehaibing@huawei.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 7 Oct 2019 22:01:21 +0200
Message-ID: <CAFBinCD+DSDoPiza2KKJAB_s6793ZeCZ6vjb5Zx9y0Cdz0mGjA@mail.gmail.com>
Subject: Re: [PATCH -next 16/34] rtc: meson: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:38 +1100
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, baruch@tkos.co.il, patrice.chotard@st.com,
 paul@crapouillou.net, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 michal.simek@xilinx.com, linux-rtc@vger.kernel.org, f.fainelli@gmail.com,
 khilman@baylibre.com, wens@csie.org, jonathanh@nvidia.com,
 ludovic.desroches@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 slemieux.tyco@gmail.com, alexandre.torgue@st.com, sean.wang@mediatek.com,
 mripard@kernel.org, vz@mleia.com, linux-mediatek@lists.infradead.org,
 gregory.0xf0@gmail.com, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it,
 linux-stm32@st-md-mailman.stormreply.com, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, linux@prisktech.co.nz, mcoquelin.stm32@gmail.com,
 computersforpeace@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Oct 6, 2019 at 12:38 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for taking care of this!


Martin
