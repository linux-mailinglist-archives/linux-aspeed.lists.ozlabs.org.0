Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 962BD8E479
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2019 07:36:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468FYq1G59zDr4t
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2019 15:36:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="So4qbdY5"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468FYl10JfzDqXC
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2019 15:36:26 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id i4so1244318qtj.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 22:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+kkJNfz1L/1lNjECte7oZEQ4lUZcKf6TkxAuh4O+hA=;
 b=So4qbdY5UtL+gcLQZ3POxMTyukbRWjWsrvKlowK+8slodSzcQhq2MQ0+Y86qGKH0Qt
 8h59wNj/5KPgsKXwLvUoVmlrIhn1VR96kfux20xYgl9huoZg6TLzXpilT2i2MI0IxeIT
 21Tnzz4VdqdpMRYLlr8/kJCOj1eK5gCWDxinQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+kkJNfz1L/1lNjECte7oZEQ4lUZcKf6TkxAuh4O+hA=;
 b=MefVY5+6pCoD5HxPKygdzvhWnZ+cI7MX3Mo22+V70lOpBYa3fFYBzY5OZgAINct2y2
 oyUDvH2/PGR3bxy91mpQYi4PZHH8DvOYtQaAV4FjxkTupx1Rm60rh7oTXOEXhrFCTA9/
 do8oViVCOhewpP3VD6h+FkxjFlxGALlXlXb2YONi3NU+h2AwMfq47ow5SvLpCsa8oIi4
 QDZANdcmKCnlj9q3rkrcIonekRdYH0sE9anDzxji7h+e0aN6eRVzzNKAl4jbw8TEKHDb
 d+01B6yRTv0Fk9agIZ4Ggx+iUmunGvExIfjyO/fym3PEiW/vWUNjWL6sKBsl2JcoN2mV
 aciA==
X-Gm-Message-State: APjAAAU0fi/tliDzCYy8pfP68vJXPACtvQYUq7Z1FDFEAxtH7Af7WSl2
 93hI80ivJ/D7u2IUHtT9iUu1delMuwuO4FPjTOg=
X-Google-Smtp-Source: APXvYqwol/tQGbguivrqClfvlzTk/yRlLUw/5IIvwxZHdBkwx1bL58BKST0+COtnMS8slC8AVVjNxk55OxxaRQNAaW0=
X-Received: by 2002:a0c:dd83:: with SMTP id v3mr2145001qvk.105.1565847383251; 
 Wed, 14 Aug 2019 22:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190807003629.2974-1-andrew@aj.id.au>
 <20190807003629.2974-2-andrew@aj.id.au>
In-Reply-To: <20190807003629.2974-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Aug 2019 05:36:11 +0000
Message-ID: <CACPK8Xe6Zp1uOqEffEc0b6oGa7portEAifGPRqb876HmA+oZeg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Document Aspeed SD controller
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, ulf.hansson@linaro.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-mmc@vger.kernel.org,
 adrian.hunter@intel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2019 at 00:38, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The ASPEED SD/SDIO/MMC controller exposes two slots implementing the
> SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> data bus if only a single slot is enabled.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Two minor comments below.

> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later

No "Copyright IBM" ?

> +%YAML 1.2
> +---

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    sdc@1e740000 {
> +            compatible = "aspeed,ast2500-sd-controller";
> +            reg = <0x1e740000 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges = <0 0x1e740000 0x10000>;

According to the datasheet this could be 0x20000. It does not matter
though, as there's nothing in it past 0x300.

Cheers,

Joel
