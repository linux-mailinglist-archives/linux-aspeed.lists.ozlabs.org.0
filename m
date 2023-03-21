Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252F6C35EC
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Mar 2023 16:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgwm92mHWz3cP0
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 02:40:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfoYbt7c;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfoYbt7c;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgwlz3Nzmz3bjj
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Mar 2023 02:40:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8B1F61CEB
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Mar 2023 15:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4889BC4339E
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Mar 2023 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679413211;
	bh=4PR9sj6dOBnQvvycf2bJCWoXgcIVXvCNTXI3u8irbUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NfoYbt7cV1cf/Ej8rnuRCJiKV5LeL2B8eI1ZM7Q++lVnlYWH23hLDGvvS7NuNCjgU
	 IpiY917ikdxUC8csvPDslhRAEd73Fc5tcYYdMazucIOU1UvWj88mz382mQxeDweXeO
	 jWud4VjyGA+XdtfkZnVK+dhcv3gzVO0k3nOWG45j0x0CzLvgF1mLdOWLa/+2l9Pccs
	 bOviRRhTzBoLmgCAuvMmdTmYdzZwHbmQcNMCKTBxPAGRSDdIyfSiHYsGVoeFNZ7+lU
	 GxWkE63y3gQEgpwqT5vpNQ0yMm1+ikSwUFsLNjPAD3bkDz2MilrNkZppLB+MWVF5iP
	 t/fUHiwC60FBA==
Received: by mail-yb1-f170.google.com with SMTP id e65so17617249ybh.10
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Mar 2023 08:40:11 -0700 (PDT)
X-Gm-Message-State: AAQBX9cXXL1e2u9mCaiDSyWHGlt7ODJaEExGibkuk+7y88Q6mHewDnqq
	yh8f2o/QyFvbiZV8eo6/TuCl4H6rNIdNAY4w/A==
X-Google-Smtp-Source: AKy350Z6P7aO5NrByvT7rh8zp3VXUqzBD9E1d6xjhBHvPz0sHMvRFfWiM44tqXup5LqtZLP44OgpN/dkvvgqIjXYIzQ=
X-Received: by 2002:a05:6902:706:b0:b6d:9e38:1017 with SMTP id
 k6-20020a056902070600b00b6d9e381017mr1567031ybt.1.1679413210325; Tue, 21 Mar
 2023 08:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230321151642.461618-1-eajames@linux.ibm.com> <20230321151642.461618-2-eajames@linux.ibm.com>
In-Reply-To: <20230321151642.461618-2-eajames@linux.ibm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 21 Mar 2023 10:39:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJR2BOX4sk0K3V7-12Pi7Th0G_Dqjfp_MxxoCf0qnNg0A@mail.gmail.com>
Message-ID: <CAL_JsqJR2BOX4sk0K3V7-12Pi7Th0G_Dqjfp_MxxoCf0qnNg0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] eeprom: ee1004: Enable devices on multiple busses
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Mar 21, 2023 at 10:17=E2=80=AFAM Eddie James <eajames@linux.ibm.com=
> wrote:
>
> The driver previously prevented probing devices on more than one
> bus due to locking constraints with the special page addresses. This
> constraint can be removed by allocating a reference-counted bus
> structure containing the lock, rather than using global variables.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/misc/eeprom/ee1004.c | 175 +++++++++++++++++++++--------------
>  1 file changed, 106 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
> index c8c6deb7ed89..950813821087 100644
> --- a/drivers/misc/eeprom/ee1004.c
> +++ b/drivers/misc/eeprom/ee1004.c
> @@ -9,12 +9,15 @@
>   * Copyright (C) 2008 Wolfram Sang, Pengutronix
>   */
>
> +#include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>

What do you need from here? I don't see anything.

of_device.h is a mess of implicit includes which I'm currently trying
to detangle. See the ~13 year old comment in it about removing
of_platform.h include. When I'm done, pretty much only bus
implementations should include of_device.h.

Rob
