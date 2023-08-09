Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEB27754BF
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 10:05:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JT7n7X7d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLN0Z51wvz2ytH
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 18:05:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JT7n7X7d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLN0T6dq6z2yV8
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 18:05:45 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe7e1ef45dso1671322e87.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Aug 2023 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691568338; x=1692173138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k8g7ZDuI5klivpIjPTpv2Wf98D/Ju1M5+69BmYKc4d4=;
        b=JT7n7X7dn/pi83oh1ZTrHlmn3jnxvICJRizVR4Big6kBGUYAKOPVxdOJXLhulbBsAS
         R0txVElZEhQprDeXp2JyRpO0W5qd4JpMghfIDV9rw+kg7zcG6Pj8qEU3Al9FpaLJFbB0
         vMKsXoiDIWZzMAu/EU6oKdnjKD/3s1dqFoQL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568338; x=1692173138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8g7ZDuI5klivpIjPTpv2Wf98D/Ju1M5+69BmYKc4d4=;
        b=SKLUYUPPvqAKTdAZsr1BXt3yx6SrULxo6VFv9e+ofyMs51GvX4/zSLhAlO+zht1Pby
         740sa4/WDSXIK3dHWj8QunS1iIV+3uY82czxlKuwiZkJKhfXAZN0OR7a6UF5csiiKhiW
         1TQtTI5mZLWADjS5aGPI6KcZpcM3XmaNDe71dKZqpBIrjdGsAwXGO7GA6pLlHQ2PuWQb
         QDrWAiZzvo8iDXrVDzV0hBbLRQZTfcZeeYWJUGKyfrdd5+kAnSsE0gDPHTT76f2HWTig
         SCPf04mkOIt7YYe4LWtwK7XXiYUchxbWCCJa2bjZ/beYJOWgaqj8CKpVFYfJJ+uoFaOh
         MF0w==
X-Gm-Message-State: AOJu0YymMhZm0luTOH6fwKy7viU7tI472WSeFuOBikkeL2eLlVpzDz4l
	GJ+YvaZxXlV1JXcXzCht+uqjk0y7RwZcFEAAru0=
X-Google-Smtp-Source: AGHT+IHsqhVUq0NHt6QqmnH2mXEw2idt+PEpuWYbmi1YQ6ByuM5q7ik12m+ONKXBFeqIa07ae+NafB4f6H3z6ktgnZ0=
X-Received: by 2002:a05:6512:2392:b0:4f9:5404:af5 with SMTP id
 c18-20020a056512239200b004f954040af5mr1398117lfv.46.1691568337444; Wed, 09
 Aug 2023 01:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230808084248.1415678-1-Delphine_CC_Chiu@wiwynn.com> <20230808084248.1415678-3-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20230808084248.1415678-3-Delphine_CC_Chiu@wiwynn.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Aug 2023 08:05:25 +0000
Message-ID: <CACPK8XfFWC-wxCt4DwNRNctXap5qiZUz-utcbpnp0vj=Z46=9Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: yosemitev4: add Facebook
 Yosemite 4 BMC
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
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

On Tue, 8 Aug 2023 at 08:43, Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
>
> Add linux device tree entry related to
> Yosemite 4 specific devices connected to BMC SoC.

Convention is to mention what kind of machine this is, to give us some
context for review. "This is an x86 server" or similar. Take a look at
existing aspeed device tree commits for inspiration.

> +&mac2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii3_default>;
> +       no-hw-checksum;
> +       use-ncsi;
> +       mlx,multi-host;
> +       ncsi-ctrl,start-redo-probe;
> +       ncsi-ctrl,no-channel-monitor;
> +       ncsi-package = <1>;
> +       ncsi-channel = <1>;
> +       ncsi-rexmit = <1>;
> +       ncsi-timeout = <2>;

None of these are properties that mainline Linux supports. Do you plan
on sending patches for these?

> +};
> +
> +&mac3 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii4_default>;
> +       no-hw-checksum;
> +       use-ncsi;
> +       mlx,multi-host;
> +       ncsi-ctrl,start-redo-probe;
> +       ncsi-ctrl,no-channel-monitor;
> +       ncsi-package = <1>;
> +       ncsi-channel = <1>;
> +       ncsi-rexmit = <1>;
> +       ncsi-timeout = <2>;
> +};
