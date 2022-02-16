Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BE4B7FD6
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 06:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz5Rd5HtHz3c9f
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 16:02:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MpCID14h;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MpCID14h; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz5RX3dPFz3bN9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 16:02:14 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id g24so821223qkl.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 21:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tYPtY5u6D3N2oAx07Twnx1Q6uW+oBqsNGkla18NTHW4=;
 b=MpCID14hiuBXc/bNPMaQ0Rcp+ls6qDgqKWHh97Z5zMzFMGaXiMikULLv20rqLswR2W
 biN4XnMARqzymx9yW/pV7hUvW7Mm22bgA5LEiqhjSc28hsqbz+Hh0GN5tL7t/LHkc4OW
 CH5jES8tubBrPzc4J3FskyOVee+0iryJjd3Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tYPtY5u6D3N2oAx07Twnx1Q6uW+oBqsNGkla18NTHW4=;
 b=iMUb8qCMkNJ232AgK0jBuaeyhdxghTcLjGhPmdw/ge44KtPeV+lGg9G6V2TeCWLS81
 3UiNz+5s9awqaCyT+mpRUJK2XIlrQHjEOC6rIjvhECin/RzBDy8FqmEpU9kEfyAPZzCI
 /n5W0sc8hDBOnzBlgr5LA4zswLNOnLlWKj6vK7dvM2U4wTLl/ZhvM2V+KUdqO2oi5apg
 h/FlF+m+k+MJd6wijMRJQSUBoN32xUVNJRaS8Xb8O4ey4fDnAZFMqHQe7vhaUfUs7qyZ
 9U44f4M37SUewg5lYOQ4AoG3ieuS0MSudnQEAHBQvZ+gIlyycpGeLOxwrd/HeVK0uYsC
 ta/Q==
X-Gm-Message-State: AOAM533VkQM0o7LQpaL652tH/o2mM7XM9ORO4JTcwN1CvDqX0kVkSSia
 p1XwQ/qf2nXH/UcCNe/MbPDeJt6zQuisnG3IiK4=
X-Google-Smtp-Source: ABdhPJy/jdRpLYMO8gCka38ySD07dqPGr2tdWJbVBEk+9TLSpek5WfeeQ28NmoNTnGFNXYbGVV8BDtT84dSYF8JIUBE=
X-Received: by 2002:a05:620a:1414:b0:47d:87ec:72b6 with SMTP id
 d20-20020a05620a141400b0047d87ec72b6mr517115qkj.666.1644987729766; Tue, 15
 Feb 2022 21:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20220215163151.32252-1-potin.lai@quantatw.com>
In-Reply-To: <20220215163151.32252-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Feb 2022 05:01:56 +0000
Message-ID: <CACPK8Xfs34gw2_XGeduJ6D=-khN7RtMj3LY8hQ8B96fFxMuE8A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] update Facebook Bletchley BMC
To: Potin Lai <potin.lai@quantatw.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 15 Feb 2022 at 16:32, Potin Lai <potin.lai@quantatw.com> wrote:
>
> This patch series update Facebook Bletchley BMC devicetree base on EVT HW
> schematioc design, and rebase SLED numbering to 1-based for OpenBMC
> multi-host.
>
> - GPIO:
>   - adding more gpio line names
>   - include interrupt line in io expander for gpio interrupt monitoring
>
> - SPI flash:
>   - adding dual flash BSM module support
>   - switch to spi2-gpio on spi2 due to unstable signal issue
>
> - Hwmon Sensors:
>   - adding INA230 sensors for monitoring
>   - fix ADM1278 shunt-resistor
>
> - MDIO Bus: enable mido3 bus
>
> - RTC: switch to external battery-backed rtc
>
> - OpenBMC: 1-based SLED numbering
>
>
> LINK: [v2] https://lore.kernel.org/all/20220214042538.12132-1-potin.lai@quantatw.com/
> LINK: [v1] https://lore.kernel.org/all/20220211014347.24841-1-potin.lai@quantatw.com/
>
>
> Changes v2 --> v3:
> - update patch name prefix
> - Disable spi2, and create a new node call spi2_gpio

Thanks, the patches look good.

Reviewed-by: Joel Stanley <joel@jms.id.au>

and given the minor differences from v2, lets add Patrick's review:

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

I've applied these for submission in the v5.18 merge window, and to
the openbmc tree.


>
> Changes v1 --> v2:
> - update the details of new added gpio line names in commit message
> - add battery-backed rtc information in comment and commit message
>
>
> Potin Lai (10):
>   ARM: dts: aspeed: bletchley: switch sled numbering to 1-based
>   ARM: dts: aspeed: bletchley: separate leds into multiple groups
>   ARM: dts: aspeed: bletchley: update gpio-line-names
>   ARM: dts: aspeed: bletchley: update fmc configurations
>   ARM: dts: aspeed: bletchley: switch to spi-gpio for spi2
>   ARM: dts: aspeed: bletchley: add interrupt support for sled io
>     expander
>   ARM: dts: aspeed: bletchley: add shunt-resistor for ADM1278
>   ARM: dts: aspeed: bletchley: add INA230 sensor on each sled
>   ARM: dts: aspeed: bletchley: enable mdio3 bus
>   ARM: dts: aspeed: bletchley: cleanup redundant nodes
>
>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 320 +++++++++++-------
>  1 file changed, 202 insertions(+), 118 deletions(-)
>
> --
> 2.17.1
>
