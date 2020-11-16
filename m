Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8498A2B3CDF
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 07:14:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJh03WdszDqNx
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 17:14:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=caWd7PQC; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJgr279nzDqPk
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Nov 2020 17:14:32 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id v11so12148911qtq.12
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Nov 2020 22:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ddE24nQujT4J4E8zVi5n6V/UPcSe6Ll28OZ8BrAwJE=;
 b=caWd7PQCiDo5DKvH4ennPUR9tOnTLqxi7X8fk12z9jr3r/dzTsePJ3c2nvqdGVEH94
 23tDzGyYr0Z4FSpHGVU3RNfCbKRgpLRBB5fZ4pYqXMTDajTc04//GY2rC1rYOE8KZKRS
 ZR71CgFRxtqGQZQFL0OJ8AJouP1kmL+0f4KNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ddE24nQujT4J4E8zVi5n6V/UPcSe6Ll28OZ8BrAwJE=;
 b=o3whBEMJijlyVQqER3Je9R9C1cvmPdopUz2JjHldPpJHV6yMOuS/Bz+qKijEzrz9YG
 8hQM3t8lWd+4BFsVFmoSP01H81qWs6I9WbKwGcXAaeO7CyD8i4ooRhQzT1V8OeR/oxDQ
 J3AC8z8GW+KN865tv1V7AFOc6MmBI7crmS+S0wQsbtwQdKFQAke3TdHCCRI2Dad0DhhX
 nN4qwMdbM2iHhcJCercWmHUfZJvA3zk+MG9z/MTy9bleGewovCUpXNXFj5KdpPRTxmCM
 xPXKYETnE7jLtBnjkIf0siAOlhgeK4hm+VRhSlv0FPFqMF8vjJBRsnB6aXy4pU/MbjPi
 /1+Q==
X-Gm-Message-State: AOAM531KzcscmyNakdcaWBN4dEWEhILy6vLyMLKpHnqZ3ZIj2AyFwU2J
 TMSSa6nFMw3Kh/ENSm8Tsv7I8b74E41gqLwczdY=
X-Google-Smtp-Source: ABdhPJxgdb5hpT67M0J/B3xkkTbq1dkPmMTpc/DBsLigD8nT5JB1RC4e68r1TOcTn4GiKMisJFqjnFeJo2jaQezNogg=
X-Received: by 2002:ac8:75c9:: with SMTP id z9mr13544465qtq.363.1605507269330; 
 Sun, 15 Nov 2020 22:14:29 -0800 (PST)
MIME-Version: 1.0
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-3-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1605247168-1028-3-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 06:14:16 +0000
Message-ID: <CACPK8XdcUyw4st2Et2W0o95sdGOvGNuyoemgt_dUzrS3dYuRcg@mail.gmail.com>
Subject: Re: [PATCH 3/6] ARM: dts: aspeed: rainier: Add leds that are off
 PCA9552
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 13 Nov 2020 at 05:59, Vishwanatha Subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
> These LEDs are on the fans and are connected via a
> PCA9552 I2C expander
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 1da7389..b7d7246 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -173,6 +173,42 @@
>                         default-state = "keep";
>                         gpios = <&pca_oppanel 3 GPIO_ACTIVE_LOW>;
>                 };
> +
> +               fan0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 0 GPIO_ACTIVE_LOW>;

Does it make sense to rename the pca0 phandle to something more
descriptive so it isn't confused with other expanders? If you want to
do that please send a follow up patch.

Reviewed-by: Joel Stanley <joel@jms.id.au>


> +               };
> +
> +               fan1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan3 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan4 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan5 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
> +               };
>         };
>  };
>
> --
> 1.8.3.1
>
