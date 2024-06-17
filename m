Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139990A761
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jun 2024 09:35:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t37YfRjb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2hWP1TCXz3fpd
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jun 2024 17:35:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t37YfRjb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2hVM5Prgz3cV1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jun 2024 17:34:50 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52cc10b5978so75438e87.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jun 2024 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718609682; x=1719214482; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xoq4EUAvhohkGeVSJqSuDIOlvwFj9GujMdx8Xhlpyd4=;
        b=t37YfRjb0Q+J/znWjUcslCT4p26jCarAh0Zj/vAEoHptVeceq96Lew86nfOGweomB9
         hLu406JoQhfvzZh9Iu/iZlBNRBRmEYKA+aIkuOj5MawdD5Fd5SKLPuZ5uCv7DefNn5lM
         OA1IKzI3QzeBGc+RifXimNKNezxNWUlwCObvPMCutlcumIKdapIR6zkJNEBCeDPGlqmU
         QuwDdLb/n26O8UebPb3Oaz/GqW5lGmNy4IOALu7vadWsQuO74/85bixM/LZginjAHRMJ
         iAYxW03IXbfmw6NF/cpZ5OMZ6ujq4GrkI/FVOfc8BG5odYkMq/wbOmJiC3YsdJjUaXrX
         ssmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609682; x=1719214482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xoq4EUAvhohkGeVSJqSuDIOlvwFj9GujMdx8Xhlpyd4=;
        b=hp8x6qFpQ4xxXbnn/VtBxxcVYPvi3T7Fc/OK6nKXIul54lxHtEHMmRIUhyj62Q511v
         zjow2R2YLEgXzY8D8wLc/kf5/OKDDhtL5RrIOMWl2oY1J8NOZ2yxc6tLkVrZtsAZB2lO
         MjgXVSXtirAauxYERFV1bQd6aFS90v2H9EQ+8fOGB4E5H0gS8ut0I12PGRALmYwp53R0
         VclBpNTuYKrze4Ygk7R9RiVlRAZFsgznnvh1I7hx1Tt/P+ea+QV37eV2zqbXujNWJFwS
         h1scaB8wgH4T7gLWyAsaoCsj15bv59niM8B3nWq4JFybaJoRYXJZvHdCCIhd0bAC6l+1
         87zg==
X-Forwarded-Encrypted: i=1; AJvYcCX71cslzDuVG6r2wCj4L78R3OjzyGWTZjuw5vpjTnLEEgTift/vFC7zuc46FvSuh1yxwKmYUZFaN7jFvNHGaof+XDU6SI56sONMtGEngQ==
X-Gm-Message-State: AOJu0Yy95GbbaDeOQKtIGzMUTCyKTSAbJ5b43GMNdIB3aPatwjc/+bNz
	0BuVtCnauyMncFGmMKX/tpQLf7SlRJmNoX0GOe+nVvPhP/k1XQBOWPhRGk7Eg3JlneX2LGpexZ8
	Q3a/W4Igza/qPTWghzdl5baAKMriXhkUt6HUEjA==
X-Google-Smtp-Source: AGHT+IGqIDqoMDiWUnJbMVSGr1EJQQ4GFqNlfiC0YOW4DAh8bCGdlwiNhRqn/j5asJGjevkFUoLeA+A2JuGUQ9QeAF8=
X-Received: by 2002:a05:6512:3c97:b0:52c:adff:4bcb with SMTP id
 2adb3069b0e04-52cadff4c84mr5977471e87.53.1718609682402; Mon, 17 Jun 2024
 00:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 09:34:31 +0200
Message-ID: <CACRpkdanSAkR-czs=OUKLh6dpiRk0QDLR-T0ECrG-Y4cY9=Vmg@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: pinctrl: aspeed: Define missing
 functions and groups
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 5:03=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> This short series cleans up a collection of binding warnings concerning
> use of undefined pinctrl functions and groups. Together they make a
> reasonable dent in the volume of output from `make dtbs_check` for the
> Aspeed devicetrees.

All patches applied.

Thanks Andrew!

Yours,
Linus Walleij
