Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F367117A
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 04:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxVy31TYPz3fBJ
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 14:05:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RJO1VvDH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RJO1VvDH;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxVx83S56z3cMr
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 14:04:59 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id kt14so21138191ejc.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 19:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MC6dKsWvLg5s18ciHdgNTii7U58PMTVdbUF07VlWry4=;
        b=RJO1VvDH+plMRGd85p0IyR4CKi1ysTABShqq6PVFfTXWLz9Sbs9tlbHH7GLWaWttXb
         55I6bKrDk/6iHEno2NwHZxJ689X3Td7B2rbPqZkkM+kCoeLgVFhZWKarkO6DLbiBqf88
         sW3EIhYkWk1cjYgP4lzgtRLDlyqgUxsafUQ1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MC6dKsWvLg5s18ciHdgNTii7U58PMTVdbUF07VlWry4=;
        b=jaRTz8E+18s6q8b65odWBZEtuKOGHTHChBnj/Y8wGfSqUzirq2wQKl9ZiplH/gq2VK
         9CLnqaENBB0DvNTRR0xE2eCV1DSmlwrM3BeNpU6JcB+e2C+P6EMzRRqPTO9M+IKHg6g4
         GoWJzfaTbeFyyX/wYnjNL7NArrS8a5FAoXH9IiAUUZ1PvGLOuDTX+mCLpwQvp9l+uhTY
         IxjNMQcWD2nl9dQnB9deraW6Vudnf/i99H7qZHA7cyFHrSCRvwqwvlkhnJ+yhDItw4Ub
         Bo70PBG/IZY7EBXDW9UiNmgtqbcuzkH9lsb/Nqlyi9FmchGKV2ghYjdAMDm1IIBybym4
         KpTw==
X-Gm-Message-State: AFqh2kqkOmn6YWo3Ha+xyDQ7stUlNs/1vBxbMVSTO8qcCOsdIn/tI2cn
	e2tJX8XVhADBdkgSpIgki2QXJF4nridS2aEUPo8=
X-Google-Smtp-Source: AMrXdXvJBiK3TuHV68yBM+CcDgve5etA6JUoAwX4XlU8mjdLj4Zs5Cw/SRDOdh0EVxK4wNh98BAHp8miuD9/paVVTuU=
X-Received: by 2002:a17:907:75e8:b0:872:1905:4185 with SMTP id
 jz8-20020a17090775e800b0087219054185mr360185ejc.651.1674011095502; Tue, 17
 Jan 2023 19:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20230111100105.707-1-aladyshev22@gmail.com>
In-Reply-To: <20230111100105.707-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 03:04:43 +0000
Message-ID: <CACPK8Xenc2E6-fe_mkoDOXXHim8ZUV9-h2vFpwUfvuen0M0aPQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ethanolx: Add label for the master partition
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 11 Jan 2023 at 10:01, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Add label "bmc" for the flash master partition. The master partition
> is required for the firmware update in the OpenBMC ecosystem.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

I've merged the 5 patches you sent for submission into v6.3.

If you have a set of device tree patches feel free to send them as a
series next time. I know they're unrelated, but by sending a series
they are easier for the maintainer tools to process as a group.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index 6406a0f080ee..889b2fdd19cf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -58,6 +58,7 @@ &fmc {
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> +               label = "bmc";
>                 #include "openbmc-flash-layout.dtsi"
>         };
>  };
> --
> 2.25.1
>
