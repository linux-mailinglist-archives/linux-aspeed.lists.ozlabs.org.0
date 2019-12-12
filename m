Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4211C12B
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 01:13:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YDm519CFzDqtQ
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 11:13:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YDlh1xlpzDqs6;
 Thu, 12 Dec 2019 11:13:01 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id 38so645999qtb.13;
 Wed, 11 Dec 2019 16:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JpkQHGI2xpytoMExaxEosFs2mgf6joP/Hf11Z973OOo=;
 b=CSt6XAY8CElDN73sZdchWCJTiVYvx0gczwNtK7YUuSVX/lG5mchWFQNQbomhcw58G2
 d92/8npPNpQ73goL6dPfm215af8SsA90ngfSDwgtOY1LnOaqE44SOOIrUTGK85AoA8E/
 aypxy00MsBhiVXUyn1al9RZIE3GrLCeLZjLI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JpkQHGI2xpytoMExaxEosFs2mgf6joP/Hf11Z973OOo=;
 b=iS1/0HYTpHuxJ4c8mB6C9+JOWjcPYT9duTHJ4VOl2nIcIofQ/sJepRuSEjawKlMMgK
 sfH6v3q3qX6gnUB5Y4bM63sfZrfGZg0RpHykS6U+A+rOTg/DfbztFV0DKEp5MBQTJpZu
 oKW6b4TfOkafqXAFmlUDx8ipUPkzusQsdPBcnLLkdi22ulBST60PQTMbsmv2IiTxfJ0R
 dqIzKhU4H+geppq1ieMpJmZFqTimSa4VBeOnj2goaXNtQNNSvy7/K6DvlljLCkOrBnX8
 D28PABA9esuMDAVvi4+lmsXbjwr2FeNoSbDXFR8dzHfH/rw2+mTZNXXVLgEbksB1JV+C
 u4GA==
X-Gm-Message-State: APjAAAUfecuzA8AVr1VWPrBZ1bqZ3D3onULS1mSokqXJCujqUxqB+OBY
 K1Gcb3C7MBpra00ZFmUW4stAAm1iWp17EjlGKVI=
X-Google-Smtp-Source: APXvYqx9tpMnePqfUyI/wqyrtIckfCZNviBzFD6lqfFJher3fMfJBT1e7NmLJtfELd5HAaHlEF3LR3ykCznnk4gFFTs=
X-Received: by 2002:ac8:3467:: with SMTP id v36mr5149667qtb.255.1576109575020; 
 Wed, 11 Dec 2019 16:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-8-brendanhiggins@google.com>
In-Reply-To: <20191211192742.95699-8-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 Dec 2019 00:12:43 +0000
Message-ID: <CACPK8XctCb9Q2RaFVHEDuWxKDXpCWMWs-+vnKZ=SeTa3xRnT_g@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] fsi: aspeed: add unspecified HAS_IOMEM dependency
To: Brendan Higgins <brendanhiggins@google.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>, jdike@addtoit.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-um@lists.infradead.org, Jeremy Kerr <jk@ozlabs.org>, davidgow@google.com,
 Alistar Popple <alistair@popple.id.au>, linux-fsi@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 anton.ivanov@cambridgegreys.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 11 Dec 2019 at 19:28, Brendan Higgins <brendanhiggins@google.com> wrote:
>
> Currently CONFIG_FSI_MASTER_ASPEED=y implicitly depends on
> CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> the following build error:
>
> ld: drivers/fsi/fsi-master-aspeed.o: in function `fsi_master_aspeed_probe':
> drivers/fsi/fsi-master-aspeed.c:436: undefined reference to `devm_ioremap_resource'
>
> Fix the build error by adding the unspecified dependency.
>
> Reported-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

Nice. I hit this when attempting to force on CONFIG_COMPILE_TEST in
order to build some ARM drivers under UM. Do you have plans to fix
that too?

Do you want to get this in a fix for 5.5?

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/fsi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index 92ce6d85802cc..4cc0e630ab79b 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -55,6 +55,7 @@ config FSI_MASTER_AST_CF
>
>  config FSI_MASTER_ASPEED
>         tristate "FSI ASPEED master"
> +       depends on HAS_IOMEM
>         help
>          This option enables a FSI master that is present behind an OPB bridge
>          in the AST2600.
> --
> 2.24.0.525.g8f36a354ae-goog
>
