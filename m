Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFB2587C8
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 08:01:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgbzv022WzDqTC
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 16:01:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Yrn5M09q; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgbzm4dG4zDqSd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Sep 2020 16:01:24 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id e23so6140506eja.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Aug 2020 23:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XaHfsFFvsKz8Si4WdVVOjQJsf4E9yNDaoM4FPWbSNvE=;
 b=Yrn5M09qMo7Ev8s79fvPnWTl2NFswv8DuA0HiCrXU9QyHiKt4/Q9LiFX09QFi10GZW
 bPayA7qZ+7h9StZJ6G8Rzq/FUGwnovc+Abo/ZKNmcTxwIiUJi2uD/uvpELc8KQojWu6s
 OAwRQUh16hX9et97nwHOUEx6hpkcFJ+Bk9O7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XaHfsFFvsKz8Si4WdVVOjQJsf4E9yNDaoM4FPWbSNvE=;
 b=EFSCjIrdEeJZXfcflOcQWztOPyRChY0MkYX8F1xmuhDIEOwxhM4++A5iN63MP2FaB3
 QD5ogiwigHBGeBi7AH9nek+DE6idLyI49HOOVV9+cJIqdBFfDKV+jzHCUd4pKPKU1X+I
 Ve0szrthKe4SoezMztpKBPtH58N7htdO4kMunpOhoHdZ+pWTM5/FEJFOCE06Ptien0Fd
 Vpcl+Hnayz9qjzmcgV3WYqwIk3rv7bKYRn5E//US90y8JLFQvZZTX+qYtC62181/o9YN
 VG8eQG53QulJlXWXuTI+EhnEd2kkRaD4urLois7ILW2tHy14xraB86qnNkfA8VnNzzkE
 c9aQ==
X-Gm-Message-State: AOAM530M3qqs7hMrib5ASEGNC4eJyEl1bu2rvTLDMZMlu7MpcYloPavz
 p1UQNkbzeS9uAoQSkehm3PCsHNeBdUUBA8EM0ho=
X-Google-Smtp-Source: ABdhPJxqy/GN58FoQLdvnCX11Vvy8+zzlnuPo/ylntZPwFduXZjSx80mFGNsb6xczOXnJ2uuauRFvtkGNeRxJJbngzI=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr110959ejw.108.1598940079725; 
 Mon, 31 Aug 2020 23:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-6-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-6-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:01:07 +0000
Message-ID: <CACPK8XcW-LfJ6FBdKntod_F1dnRoSP=4D7=TLtM5yGkhTm79Rw@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: Aspeed: Rainier: Add IBM Operation Panel
 I2C device
To: Eddie James <eajames@linux.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, dmitry.torokhov@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set I2C bus 7 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Same comments as for Tacoma.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index b94421f6cbd5..f121f3c26a3a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -698,6 +698,7 @@ eeprom@53 {
>  };
>
>  &i2c7 {
> +       multi-master;
>         status = "okay";
>
>         si7021-a20@20 {
> @@ -831,6 +832,11 @@ gpio@15 {
>                 };
>         };
>
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <0x40000062>;     /* I2C_OWN_SLAVE_ADDRESS */
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 2.26.2
>
