Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B076711B9
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 04:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxWG063nxz3cMr
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 14:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gFJ6plrG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gFJ6plrG;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxWFr5Qklz2yjR
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 14:19:26 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id mg12so7751890ejc.5
        for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 19:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FgA+6yqUgolw/SqxO1YAy7+szNjmtGYdLu65H2lP81o=;
        b=gFJ6plrGY2qMO2z6gkb3oSWK7AMapIqGWeg4VhsfPJQ3yF5qtcB5TSjijGQibJL8aI
         5ZcYvl4phtUmhwoVVWlnghRSHBf+w4zha54HhzQk8XYYCpLvWRWM5TflHwuCvaT3Ipad
         1PiD+YpN4tNwnLllc4kviZkPn4Uagic+7Cnp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgA+6yqUgolw/SqxO1YAy7+szNjmtGYdLu65H2lP81o=;
        b=YfoAOz66ESMqDmdTPJ32XUXlRUTsnD8yfq7xq0OccyGgL/B3RP4TGFrCaZioN5GmEf
         Cgx0pCiLWizJdT8AfF6dzs8n48HlKt5XmAIpAxa6pGYx3TXV1haq//g5Zd334+fPF0WW
         O0GwX7muvKgLCzTvUzt0FiCeU/0m0IRl1W6bQ1G68rFK3BMF2qr6AHHr+xkVaxNPzwzI
         KdlXOudaiR4gBYl6fo+VL8tafaiVoIsm3d29aY9NaMEKupJPPMUDq/FqBJzwhjMCKqKd
         5n9/9z+vxjiBSRWnnbVR+TMS6xvd+DK0P4BT9QzYlaDeJlW4jcMPuC5H6NjLy9FV2A3v
         FUXw==
X-Gm-Message-State: AFqh2ko0+WIqRIEwIM7yjH7jtLYzSmSig4hzZzJzRiwHRR3j5nYWt0l8
	oN/rkUIHlNVT/8ldD8/TaP7c7EIHrRQfpcIpB7U=
X-Google-Smtp-Source: AMrXdXsF4H3MGnT6GULCJ3IMPm1iznAunBegxShAmG0yJaPN1dHMmR98JqAWtVJ7/AwYH44IZCvxUjrEJny8HwSs1g0=
X-Received: by 2002:a17:907:75e8:b0:872:1905:4185 with SMTP id
 jz8-20020a17090775e800b0087219054185mr362309ejc.651.1674011962419; Tue, 17
 Jan 2023 19:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20221226054535.2836110-1-potin.lai.pt@gmail.com> <Y7SX/6bsztulhw7/@heinlein.taila677.ts.net>
In-Reply-To: <Y7SX/6bsztulhw7/@heinlein.taila677.ts.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 03:19:09 +0000
Message-ID: <CACPK8XdPiHZJo69K99ZL=kWVis_X=JtSAWuYN6FCAVpijcjirw@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: bletchley: Update Bletchley devicetree
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 3 Jan 2023 at 21:10, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Dec 26, 2022 at 01:45:33PM +0800, Potin Lai wrote:
> > Update Bletchley BMC devicetree.
> >
> > Potin Lai (2):
> >   ARM: dts: aspeed: bletchley: rename flash1 label
> >   ARM: dts: aspeed: bletchley: enable wdtrst1
>
> Series is
>
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

Merged for submission in v6.3.

Cheers,

Joel
