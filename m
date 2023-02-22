Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE869F6D2
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Feb 2023 15:41:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJkt2y9cz3cDp
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Feb 2023 01:41:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.52; helo=mail-qv1-f52.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJkn4BmNz3bg9
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Feb 2023 01:41:35 +1100 (AEDT)
Received: by mail-qv1-f52.google.com with SMTP id oj14so8632593qvb.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Feb 2023 06:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lyg7tFXKKjj8PrnUvFEvHIekvmZr7jdKTCzqqNpQ8t4=;
        b=xdw1bu/e1X9qs48uPacOcbWrbRlAmgrL3z8HB4ZJJUtQMz5NkMWd7jEV3gq7O1KXAf
         J1R8ouM3wShpVYh6HS/ST1mp5m4cZmym9Vxu06xm62FIaPab2AFGNpKac7vAAYFmmMrq
         dOGluRFElwn4B4XCf31TFm4oRvZQJG/EgUXWzU84f4bduAxMymC+fungMEMK3UGvIoG1
         zJuB/EJQvkgjiLn3NqZySdaaeNoY31vrcZHgbnBF9GN5Y43cWW3WBEEKqTmIutva3IoE
         iJ3vcyMPcwytGwtYIQVyQ9O55imx0qDBcg6cOYOJmECDUEE+0m4NwU2e4DINLpEs+ueF
         vjZw==
X-Gm-Message-State: AO0yUKUavduj7jMCosd1+vNmDeOcGS0J5bn/ziRL6rWedzCcb/8s24m/
	FaEH5CbjyfFecIFajCD0zpfjYLegECdBqA==
X-Google-Smtp-Source: AK7set80VKvgXt2x+DG9s6xGno3rA03SJJ7NOc/U8dwPo1hZhkQmPQj+GzY18gc1u3ua03klNFMS5Q==
X-Received: by 2002:a05:6214:4011:b0:56f:796e:c386 with SMTP id kd17-20020a056214401100b0056f796ec386mr16915441qvb.17.1677076891819;
        Wed, 22 Feb 2023 06:41:31 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id r21-20020a37a815000000b00742301f1bfbsm2176520qke.45.2023.02.22.06.41.30
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 06:41:30 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id v78so9011680ybe.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Feb 2023 06:41:30 -0800 (PST)
X-Received: by 2002:a25:fb0e:0:b0:890:ac61:3ed9 with SMTP id
 j14-20020a25fb0e000000b00890ac613ed9mr850231ybe.540.1677076890300; Wed, 22
 Feb 2023 06:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20230104013436.203427-1-neal_liu@aspeedtech.com> <20230104013436.203427-2-neal_liu@aspeedtech.com>
In-Reply-To: <20230104013436.203427-2-neal_liu@aspeedtech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Feb 2023 15:41:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVS_JF0+5CyNM6ivxqRLKkMte9=Xw5E-fc-OTHibwc5vw@mail.gmail.com>
Message-ID: <CAMuHMdVS_JF0+5CyNM6ivxqRLKkMte9=Xw5E-fc-OTHibwc5vw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] crypto: aspeed: Add ACRY RSA driver
To: Neal Liu <neal_liu@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Neal,

On Wed, Jan 4, 2023 at 2:37 AM Neal Liu <neal_liu@aspeedtech.com> wrote:
> ACRY Engine is designed to accelerate the throughput of
> ECDSA/RSA signature and verification.
>
> This patch aims to add ACRY RSA engine driver for hardware
> acceleration.
>
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>

Thanks for your patch, which is now commit 2f1cf4e50c956f88 ("crypto:
aspeed - Add ACRY RSA driver").

> --- /dev/null
> +++ b/drivers/crypto/aspeed/aspeed-acry.c

> +static int aspeed_acry_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_acry_dev *acry_dev;
> +       struct device *dev = &pdev->dev;
> +       struct resource *res;
> +       int rc;
> +
> +       acry_dev = devm_kzalloc(dev, sizeof(struct aspeed_acry_dev),
> +                               GFP_KERNEL);
> +       if (!acry_dev)
> +               return -ENOMEM;
> +
> +       acry_dev->dev = dev;
> +
> +       platform_set_drvdata(pdev, acry_dev);
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       acry_dev->regs = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(acry_dev->regs))
> +               return PTR_ERR(acry_dev->regs);
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +       acry_dev->acry_sram = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(acry_dev->acry_sram))
> +               return PTR_ERR(acry_dev->acry_sram);
> +
> +       /* Get irq number and register it */
> +       acry_dev->irq = platform_get_irq(pdev, 0);
> +       if (acry_dev->irq < 0)
> +               return -ENXIO;
> +
> +       rc = devm_request_irq(dev, acry_dev->irq, aspeed_acry_irq, 0,
> +                             dev_name(dev), acry_dev);
> +       if (rc) {
> +               dev_err(dev, "Failed to request irq.\n");
> +               return rc;
> +       }
> +
> +       acry_dev->clk = devm_clk_get_enabled(dev, NULL);
> +       if (IS_ERR(acry_dev->clk)) {
> +               dev_err(dev, "Failed to get acry clk\n");
> +               return PTR_ERR(acry_dev->clk);
> +       }
> +
> +       acry_dev->ahbc = syscon_regmap_lookup_by_phandle(dev->of_node,
> +                                                        "aspeed,ahbc");
> +       if (IS_ERR(acry_dev->ahbc)) {
> +               dev_err(dev, "Failed to get AHBC regmap\n");
> +               return -ENODEV;
> +       }
> +
> +       /* Initialize crypto hardware engine structure for RSA */
> +       acry_dev->crypt_engine_rsa = crypto_engine_alloc_init(dev, true);
> +       if (!acry_dev->crypt_engine_rsa) {
> +               rc = -ENOMEM;
> +               goto clk_exit;
> +       }
> +
> +       rc = crypto_engine_start(acry_dev->crypt_engine_rsa);
> +       if (rc)
> +               goto err_engine_rsa_start;
> +
> +       tasklet_init(&acry_dev->done_task, aspeed_acry_done_task,
> +                    (unsigned long)acry_dev);
> +
> +       /* Set Data Memory to AHB(CPU) Access Mode */
> +       ast_acry_write(acry_dev, ACRY_CMD_DMEM_AHB, ASPEED_ACRY_DMA_CMD);
> +
> +       /* Initialize ACRY SRAM index */
> +       aspeed_acry_sram_mapping(acry_dev);
> +
> +       acry_dev->buf_addr = dmam_alloc_coherent(dev, ASPEED_ACRY_BUFF_SIZE,
> +                                                &acry_dev->buf_dma_addr,
> +                                                GFP_KERNEL);
> +       memzero_explicit(acry_dev->buf_addr, ASPEED_ACRY_BUFF_SIZE);

When compile-testing with CONFIG_HAS_DMA=n:

    error: argument 1 null where non-null expected [-Werror=nonnull]

The call to dmam_alloc_coherent() lacks error handling, as the returned
address may be NULL.

Moreover, is it safe to allocate this buffer only after the call to
crypto_engine_start()? I.e. could acry_dev->buf_addr be accessed
before, causing a NULL pointer dereference?
Is there any other initialization that should be done earlier?

> +
> +       aspeed_acry_register(acry_dev);
> +
> +       dev_info(dev, "Aspeed ACRY Accelerator successfully registered\n");
> +
> +       return 0;
> +
> +err_engine_rsa_start:
> +       crypto_engine_exit(acry_dev->crypt_engine_rsa);
> +clk_exit:
> +       clk_disable_unprepare(acry_dev->clk);
> +
> +       return rc;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
