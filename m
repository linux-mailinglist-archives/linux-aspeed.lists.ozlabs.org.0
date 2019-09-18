Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5075EB64F0
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2019 15:44:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YLnG0D6XzF3qf
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Sep 2019 23:44:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qS7h3ZDA"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YLgB0KwyzF39Z
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2019 23:39:17 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w10so3196841plq.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2019 06:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3coPOKz829YesHs8WeDQ/ai4YhjPoVLGbSy497MH0Io=;
 b=qS7h3ZDAoTFnRgGv1UvQCSos0CEKYa1Ol1rQOd4jzD/JiSP6N5vVOwdF3Z8RuVSoZr
 1mDJJ7fYVFpPwIN02QXU82nX1V+QV9KrobEe4wkD83KdWXbj43Yh4BTcbIURV2Napwuy
 IgdbW27UiEIT0qhx5u4WUTm62RgWNpl+ewghEdfF28M0X8pHIJn5YRfGbPLFERi2EzQh
 uW5DYqh/4bV9ON4D8XGmAcLmkChMCsh/jlDakaMQu2SgxvoiopdjqpLss1xB9NPiOefk
 2VRAUUDEYjHdTJ8B2l6jpzLuUONFWHhdDDGzYQSKQr8A3J3URqnCeq/KL0chK7/u1pRV
 g+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=3coPOKz829YesHs8WeDQ/ai4YhjPoVLGbSy497MH0Io=;
 b=YOwZV0Cdq/pm7VkOiW1eP5WhlRX6NSmdiG/1NGgdpkI0MV2rXRi4Mazr3Z8s/Tu6N9
 MDKzNCSzqyMwy+iEBF2Pxxa114VjxILNItrj2PGoFT7KfJtPBGdXONx4+uJncBYno+1j
 7hUOBhZAurJcFgo788jzzCRi6vlNa/hWjK5btFSS6ShBCsC3EMPbXN6YwaGR1/lOYuNN
 HJDmx9QAjIf/l0Lku72K+kw0sB565CYvziAqLYwclIzQMy1NUwUEqerYHC7wi6v17RVD
 8Z7HyXIDRBzqgt7/cEtS6LvVi+mqg+OYuRYK5gwczjU8pPwyGel6Df6RkuBzum7zLGsd
 w1zA==
X-Gm-Message-State: APjAAAVHIjkcW9kHOBBV4TpxzI5LuzAlJh2FZeAKT44aA5sDilsm+VIA
 1PiR11gGndVQ77SKqaNGWU0=
X-Google-Smtp-Source: APXvYqx81mSybzdQj0FZPyN7+YBbDAJ170gLkLCt6Wq3XQvIapP6vM/UArMpEQXp4CHtzTBTBTmctA==
X-Received: by 2002:a17:902:8f90:: with SMTP id
 z16mr4266870plo.138.1568813953713; 
 Wed, 18 Sep 2019 06:39:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 197sm18396233pge.39.2019.09.18.06.39.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Sep 2019 06:39:13 -0700 (PDT)
Date: Wed, 18 Sep 2019 06:39:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Use
 devm_platform_ioremap_resource() in aspeed_pwm_tacho_probe()
Message-ID: <20190918133912.GA14788@roeck-us.net>
References: <cd5bab7b-9333-2a43-bcf0-a47bbbe719eb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5bab7b-9333-2a43-bcf0-a47bbbe719eb@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Himanshu Jha <himanshujha199640@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 18, 2019 at 10:20:09AM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 10:12:31 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> --
> 2.23.0
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 40c489be62ea..33fb54845bf6 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -891,17 +891,12 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  	struct device_node *np, *child;
>  	struct aspeed_pwm_tacho_data *priv;
>  	void __iomem *regs;
> -	struct resource *res;
>  	struct device *hwmon;
>  	struct clk *clk;
>  	int ret;
> 
>  	np = dev->of_node;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENOENT;
> -	regs = devm_ioremap_resource(dev, res);
> +	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
