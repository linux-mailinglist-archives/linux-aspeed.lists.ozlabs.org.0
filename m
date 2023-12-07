Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4953807CC7
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Dec 2023 01:10:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mjgtjf+t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slvn62wVxz3cRy
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Dec 2023 11:10:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mjgtjf+t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Slvmx5kWFz30Q4
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Dec 2023 11:10:40 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-548ce39b101so452121a12.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 06 Dec 2023 16:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701907830; x=1702512630; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0yA9MR91ePkju7nca9/BkZnzwRCmKruvRUqc9sHYXbs=;
        b=mjgtjf+tVkk3yK0oa2smP0epA5l06GWHpeS3Wms0kfcHmpOtbi7h87HOEmJiPnwq0r
         gO1Mt6ri15kT3r2sW7ro/ah/RGc4XVZenyCsbYNdTlITfosR47o5C2kqP3FAN8HMjqHY
         tCtzh4jURnejuVBiufAFPz/BO/5bjmvfbfguE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701907830; x=1702512630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yA9MR91ePkju7nca9/BkZnzwRCmKruvRUqc9sHYXbs=;
        b=jipA1yN/g5TVIhsnd8TWDfsh+21IthlFsofhG4rSsczdP9wrFd43iqGhgu4J/87372
         bBnFqRpS8fzyeGQPpRaFxL7r0AlZKX28PWYjCN81djzdH2wMuyUiT25z6YZAhasatL4J
         E8RSQJtWU6V6p83UyrogiMYGtHMizp1Y8iUGeAAzvOfJ4YFAfiyX7Yq2ZL9Cdw/S3R8r
         5YHdU2N8/cWmYqBRbJ03ORRBmQf9wvu9PpqSd7MMdnvWRfJRuxOZlJn7Mx7k5uioUz6m
         qzF0VYSwZtVV7rCRm7Pi0yMF9jwpiiqWiBtKWF31Hw+SZgz0h7nZ6xx/dfubHV+XgeA3
         rBCg==
X-Gm-Message-State: AOJu0Yy0hHb2Duw8S0tXiMlUn9AL/KsIXe/JQoOrMD1n6kUk8NuxTtj1
	+Uj5/pCp6zHt4NTFICxlNMyfwy7ql2OZOxj3Mek=
X-Google-Smtp-Source: AGHT+IEYmwT9MlyD95aEzDWmDlAFWtRHjJrEZFs5P5trbXnhy2s8EqkN0CnnoHwWcsvNS/RlitpXI3l8AyRaB8YCmZc=
X-Received: by 2002:a17:906:d104:b0:a19:a19b:422f with SMTP id
 b4-20020a170906d10400b00a19a19b422fmr730295ejz.154.1701907830244; Wed, 06 Dec
 2023 16:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20231206155316.4181813-1-peteryin.openbmc@gmail.com> <20231206155316.4181813-3-peteryin.openbmc@gmail.com>
In-Reply-To: <20231206155316.4181813-3-peteryin.openbmc@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Dec 2023 10:40:17 +1030
Message-ID: <CACPK8XepWC+KUaYr8nQJ9ggkX5n=aQzT_U5+u_N86=LthkbwDw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: Harma: Add Facebook Harma
 (AST2600) BMC
To: Peter Yin <peteryin.openbmc@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 7 Dec 2023 at 02:25, Peter Yin <peteryin.openbmc@gmail.com> wrote:
>
> Add linux device tree entry related to
> Harma specific devices connected to BMC SoC.

This isn't a very helpful commit message. Convention is to mention
what the system is to give context; eg "The SuperCorp Machine1
multi-node server system uses an AST2600 BMC".

> +&mac3 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii4_default>;
> +       no-hw-checksum;
> +       use-ncsi;
> +       ncsi-ctrl,start-redo-probe;
> +       ncsi-ctrl,no-channel-monitor;
> +       mlx,multi-host;
> +       ncsi-package = <1>;
> +       ncsi-channel = <1>;
> +       ncsi-rexmit = <1>;
> +       ncsi-timeout = <2>;

These properties are not supported by the kernel. It seems Facebook
uses them in their machines, it would be great if you contributed
support for them to mainline.

If not, please drop the properties.

> +
> +&gpio0 {
> +       pinctrl-names = "default";
> +       gpio-line-names =
> +       /*A0-A7*/       "","","","","","","","",
> +       /*B0-B7*/       "","","","",
> +                       "FM_BMC_MUX_CS_SPI_SEL_0","FM_ID_LED_N","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","","SOL_UART_SET","","","","","",
> +       /*E0-E7*/       "","","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "LED_POSTCODE_0","LED_POSTCODE_1",
> +                       "LED_POSTCODE_2","LED_POSTCODE_3",
> +                       "LED_POSTCODE_4","LED_POSTCODE_5",
> +                       "LED_POSTCODE_6","LED_POSTCODE_7",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "FP_SYS_PWRBTN_IN_N","BMC_SYS_PWRBTN_OUT_N",

Is this machine going to run openbmc?

We have a set of documented properties for GPIOs such as the power button:

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

If you intentionally do not want to follow this scheme, please mention
why in your commit message.

Cheers,

Joel
