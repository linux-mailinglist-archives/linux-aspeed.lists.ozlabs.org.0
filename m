Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B3C2587B2
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 07:58:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgbwd05z7zDqTY
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 15:58:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cTMpbC4o; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgbwS3r3YzDqSd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Sep 2020 15:58:29 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id l21so236914eds.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Aug 2020 22:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXS7+3EgnC5I92ixxRxNaCdg1MKz+VkNDCcOltlFbJA=;
 b=cTMpbC4o8DudpdOFlrGnTxYKJhR5TLl9BTn35t1Vg80O5o366+KbhUnyM7rEN5o1cj
 gLVgVdvfRy2k8csl7iDtnYcWyRBV54dXE4hV+jPTK7+YPFFOVNaJ6hiNjWPJfKqj3mE+
 TlMOCmQ8kMybmwAZ2PzJZbHgzB3c8HMJrduJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXS7+3EgnC5I92ixxRxNaCdg1MKz+VkNDCcOltlFbJA=;
 b=HkkIFl9Q3sLrAQj3fuRzA1RQd0qPAPqs29/OJsE1kAtug/QeRMgd+7DAo4ADURRCCs
 UtLYaKCsjE3Zzdl2CAtqeo7cpxaI4Veqp7yLsv0fhjNAHxapTLwTYRdNO/wsrh9Tmhil
 kfafHVRtcTzN6rlPGwqR3nKpGAhh3P85YHJbJyPghIVL+RLNwkhYgDCZJ57NDP7mxArg
 l23l/wo3yoJw4D1ebehxcXncFD40YgRAGmv5fK2R3ucgmmeF0jKqWTFT6bkTTCy7FZZH
 tkYtVPCFVYz7Ag6Dv2jJR4CpXdyvipus0JWl1BGo2vWLI+sNgUS1gJg32op7rmo8Udhp
 yoTA==
X-Gm-Message-State: AOAM533sG5wLxkFJ3i+8K9HU581yvke81wyXZzbyiZFcJ6XPQdcDnaxI
 yuofogUrBB7H3YTX1hCoVeXqm3EO5srZjQG7sh8=
X-Google-Smtp-Source: ABdhPJzPz7FKzhyE9tVkVgSodtZ62x5Kp312jVoxK4YoGK8nlMeYcU3Y4PKQ1ykmm4tDi9GtbIpQnd5EMQO2LKaGHEc=
X-Received: by 2002:a50:f403:: with SMTP id r3mr342011edm.260.1598939905467;
 Mon, 31 Aug 2020 22:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-3-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 05:58:12 +0000
Message-ID: <CACPK8XdMqZv5f0X1-G2WPrYSpYMpMjJC4WxNsiKSxqtWb0M1jw@mail.gmail.com>
Subject: Re: [PATCH 2/5] input: misc: Add IBM Operation Panel driver
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
> Add a driver to get the button events from the panel and provide
> them to userspace with the input subsystem. The panel is
> connected with I2C and controls the bus, so the driver registers
> as an I2C slave device.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  MAINTAINERS                    |   1 +
>  drivers/input/misc/Kconfig     |  10 ++
>  drivers/input/misc/Makefile    |   1 +
>  drivers/input/misc/ibm-panel.c | 186 +++++++++++++++++++++++++++++++++
>  4 files changed, 198 insertions(+)
>  create mode 100644 drivers/input/misc/ibm-panel.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a9fd08e9cd54..077cc79ad7fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8283,6 +8283,7 @@ M:        Eddie James <eajames@linux.ibm.com>
>  L:     linux-input@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> +F:     drivers/input/misc/ibm-panel.c
>
>  IBM Power 842 compression accelerator
>  M:     Haren Myneni <haren@us.ibm.com>
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 362e8a01980c..88fb465a18b8 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -708,6 +708,16 @@ config INPUT_ADXL34X_SPI
>           To compile this driver as a module, choose M here: the
>           module will be called adxl34x-spi.
>
> +config INPUT_IBM_PANEL
> +       tristate "IBM Operation Panel driver"
> +       depends on I2C_SLAVE || COMPILE_TEST
> +       help
> +         Supports the IBM Operation Panel as an input device. The panel is a
> +         controller attached to the system with some buttons and an LCD display
> +         that allows someone with physical access to the system to perform
> +         various administrative tasks. This driver only supports the part of
> +         the controller that sends commands to the system.

Is this always attached via a service processor/bmc? If so, mention it
here so people know there's no point enabling it on a host/distro
kernel.

I assume you're implementing the protocol correctly.  If you have a
link to a specification then include that in the file.

The code looks okay to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>
