Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA628067B7
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Dec 2023 07:46:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YZHrcr5N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlScW56NVz3cZw
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Dec 2023 17:46:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YZHrcr5N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlScH1ksFz3cDT
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Dec 2023 17:46:37 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c967010b2so1126343a12.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Dec 2023 22:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701845188; x=1702449988; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7HVLCsTwM0AJQ7P3LEZ/Kcz/0E6qcEp8zHBIIWNc8vA=;
        b=YZHrcr5N91hkZ/2ppwHfbu5Hw6/pJFd5HnX9lVwQQqyahtU5bcBNfxuGKrQLygXeZQ
         uo9D9OEyNurhOh9fGvjcnqIonPFyT2hwELS7aPONr7uLlYFDMnEQujoqwV7OqfAUOxQx
         4wh2NcqqDsYyD2jAwPkJsRRvRCa6L6ETNXsYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701845188; x=1702449988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HVLCsTwM0AJQ7P3LEZ/Kcz/0E6qcEp8zHBIIWNc8vA=;
        b=tc5YYSUKN76mmqzqC0S4THSPCoL6aT2kP8JQySvoCfC6IS0f6leUDQifv4vGpxvhw0
         OznBz8+7ovJfAUFGPO3c72Dns878yg0gv/Ya5ED1UT3Q3cLo3UzDWjkn+lf/i/s4cP1R
         A7kTlOpLjinf3gik5lGJEwgxFgnUsJTYVHzguEIONtN+FXnC7PC/8JGexzYdBeNMVX47
         tDT55JqT3oR0Y+jd4FSPY2SPqbq33lrx0wYYjlfktNvoHUzm1GM/17r+F7+/GuWGVLOw
         zRWKLQOJEUfZEJMAD2FGPmRNzcbgqo80GewGXSn3/hnrHci9navEQw59BuYo1myO5qX1
         0dyA==
X-Gm-Message-State: AOJu0YzOY9sLwPyryH8IOpYZMUNLBE83vAC0NOP0RF/2pgwuS+veg8o1
	AOtp0qxJ0uYk7CnoSdirmg78h3tR8OeVQSqtfy0=
X-Google-Smtp-Source: AGHT+IHk5A7B0U4wO24pz2HCwBWIvrSswHBxiBDm7juowHDhQdsr4u3Yd57RZEy+FbH8wjd9qhmCMTkRudGz8aw8gBA=
X-Received: by 2002:a17:906:c292:b0:a1b:75f6:165c with SMTP id
 r18-20020a170906c29200b00a1b75f6165cmr2521102ejz.52.1701845187768; Tue, 05
 Dec 2023 22:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20231202003908.3635695-1-renze@rnplus.nl>
In-Reply-To: <20231202003908.3635695-1-renze@rnplus.nl>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Dec 2023 17:16:15 +1030
Message-ID: <CACPK8XfhK8eSjYvEd=7WshOh+Sj6vrERxwgAYGitVALw0pUf8w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
To: Renze Nicolai <renze@rnplus.nl>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 2 Dec 2023 at 11:09, Renze Nicolai <renze@rnplus.nl> wrote:
>
> Hello,
>
> These patches add a device-tree (and a bindings update) for the
> Aspeed BMC on the ASRock X570D4U, so that it can be added as a
> supported OpenBMC platform.

Looks great!

Reviewed-by: Joel Stanley <joel@jms.id.au>

I've also added this to the openbmc tree, so no need to send the patches there..

>
> Changes since v2:
>   - Renamed leds to led-0 and led-1 to match Documentation/devicetree/bindings/leds/leds-gpio.yaml
>   - Added aliasses and labels for the i2c-mux on i2c bus 4
>   - Added the missing blank line between the ehci1 and uhci nodes
>
> Greetings,
> Renze Nicolai
>
> Renze Nicolai (2):
>   dt-bindings: arm: aspeed: add Asrock X570D4U board
>   ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
>
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 377 ++++++++++++++++++
>  3 files changed, 379 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
>
> --
> 2.43.0
>
