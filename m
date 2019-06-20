Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2284C97D
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jun 2019 10:30:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tw3s0RfXzDrBp
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jun 2019 18:30:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="CtuzE3Xr"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tw3l28NLzDr84
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 18:29:52 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id i34so2364917qta.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+LDECNzk7Ax81lY+NTXinI2CggAW7FJancdnXbish8=;
 b=CtuzE3XrAV1rVmsdqj11M6pmKHISAnlRUomi1TlE3HzkVaVNorKLX2wW/stFBg1Bv6
 DyIHp3jITT2jE0rKVoCLPQ360+74LzXT6mmKu2+NrX5JQsoKH9lgwciuIWycQoNxySYe
 E/CSxBpptpTlZ//LZbwz0Wkz4IVdBnFrG+bkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+LDECNzk7Ax81lY+NTXinI2CggAW7FJancdnXbish8=;
 b=o02zpwXuuAgTa2LLw6RTHhqQ1Ono1h6oI3aBV6ZPKdpsq/psH0HNG5UALIgOi9CMWi
 VamyJEVsdIB4O/zA69K2ZGK7oimIg9DFh/F10S1D8XsiT49dx1Eoiv6gMnwyBiEuq7WM
 cH4CLUfCoc2S47uN/BG287Aq5UceMthn3M/DOFruNK9ig0WnRDL0YW3hjksvNpqtTKre
 +YHAxm3KQD0E2dkL19wAExKcRoyuXSsTCJralN/VOFWAmf4YL8ye4089taahz+En91Rl
 rRKeZyKd2ZXarDjUmoFaPP4aatJbyyfYxqQ2kjRZOWw9Y42BXAXBPhnu/TFOAncxb6h/
 UbFA==
X-Gm-Message-State: APjAAAWZUJOz6/BDqCwS7oPBosPw+pY7xIP2EgB8/+YsPd8RcHTg/3yR
 jER+7MFmonrO2YYZYghhygQi6ONO2rWqNTpIPBY=
X-Google-Smtp-Source: APXvYqz9ktCSXKcc8gJFwqeG+AN29q9x2gYJJMH1Lf+t9yZGIz77JKqmMdeqFF/zzNE+Y8nQBNbxTH4cVcRoubKl5l0=
X-Received: by 2002:a0c:afd5:: with SMTP id t21mr38274708qvc.105.1561019389077; 
 Thu, 20 Jun 2019 01:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190619125636.1109665-1-arnd@arndb.de>
In-Reply-To: <20190619125636.1109665-1-arnd@arndb.de>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jun 2019 08:29:36 +0000
Message-ID: <CACPK8Xe0Ppr8QjPSTPyNSHEbSXvuZLjC04hqP6ATTSystY888w@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: fix probe error handling
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-aspeed@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 19 Jun 2019 at 12:56, Arnd Bergmann <arnd@arndb.de> wrote:
>
> gcc warns that a mising "flash" phandle node leads to undefined
> behavior later:
>
> drivers/soc/aspeed/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
> drivers/soc/aspeed/aspeed-lpc-ctrl.c:201:18: error: '*((void *)&resm+8)' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>
> The device cannot work without this node, so just error out here.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd. This looks like it applies on top of Vijay's recent patch?

The intent of that change was to make the driver usable for systems
that do not want to depend on the flash phandle. I think the fix we
want looks like this:

--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -224,10 +224,11 @@ static int aspeed_lpc_ctrl_probe(struct
platform_device *pdev)
                        dev_err(dev, "Couldn't address to resource for
flash\n");
                        return rc;
                }
+
+               lpc_ctrl->pnor_size = resource_size(&resm);
+               lpc_ctrl->pnor_base = resm.start;
        }

-       lpc_ctrl->pnor_size = resource_size(&resm);
-       lpc_ctrl->pnor_base = resm.start;


Vijay, do you agree?

Cheers,

Joel

> ---
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> index 239520bb207e..81109d22af6a 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> @@ -212,6 +212,7 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>         node = of_parse_phandle(dev->of_node, "flash", 0);
>         if (!node) {
>                 dev_dbg(dev, "Didn't find host pnor flash node\n");
> +               return -ENXIO;
>         } else {
>                 rc = of_address_to_resource(node, 1, &resm);
>                 of_node_put(node);
> --
> 2.20.0
>
