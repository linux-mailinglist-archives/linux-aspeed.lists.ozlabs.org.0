Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BD999EBE
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2024 10:09:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPzmR6LD0z3c00
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2024 19:09:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728634150;
	cv=none; b=IVMDjR7IW9Wcxf7Avb+3qaVLZ8F2P5uHU7+B6w+qJMU+RblXOFJ5n74FxuLGZfB8R/4dQpqnXXsasf0l/99rYAFd0BOn+mg6y/80N2eom/qxcx3FxzIRxoZ0VfQCxy3DCxhppsk33QDzUWROHbjQP67V2IZcEXw3puGiThGFgmROA8NelTT7KFR1CrII4UW/su88xTyrzjD0XUGzgKdpkYew/xtgBq2g3d2DazF6JdaXEjfVaIrD4r/xTWfyQBmHnNYadpNx70e0RFeRH5R33oN8vSw1xosQ4lsiCe4bgJs/bky5doxN3lOcgP9qtUNyqBbsWcv8knoWsmRHrSXULA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728634150; c=relaxed/relaxed;
	bh=8WRD3jbo/tTNYRziqpYEKDmK590mjZZMZmbwUA+4tqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCRHothJI9QPZTqmb2H6QW7bjPw4ZekjpprqESIdCkOKc0avMMcd/NndUxassiSIjRdhUsbBCpNqCcViACCe8RW+IaGxnCbpEM2fPpZWZyIP8brYVhD7jtyPDhM3220ndca9KZuFQA/tyRjAwhuUvA2BMRWEuz+sGBv61FEgIFlR0dhApDMkP7ri/YgRdcEoQ4K/nIX0kdN4GfX3TmbWGlg6aj1EYvQkG1B/WhKUt2y2JWwfI0TxLd9/N8iCMpmFVYxoIIimx4x6XpJhiccMObUOHkBkRjt8dBPc4FcEarRia1PMR1UMj6QREqCIdTHKNVw0VSJ0Fz4pdzkZzlSfkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=W92WxmNW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=W92WxmNW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPzmN6sLYz3bs0
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2024 19:09:07 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ea56070f86so202304a12.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2024 01:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1728634145; x=1729238945; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8WRD3jbo/tTNYRziqpYEKDmK590mjZZMZmbwUA+4tqc=;
        b=W92WxmNWRJhtxNhsbJ2x4M6Q3OTT6cCcQ+iTopGcUst3hCPfykX2Xyz587uaVcMimq
         u+D7u7xAGDGWJO42Qiao14/pUGQDoyP+Wt9KCEzegVfOus0FqGYH/igR+wLzdS/qPPyT
         be2TCArVrMyEUJ+1WNLC6z2A8iR+ggZIn0Zo/apCmviLp9keoCXq7SKtHJXfVul3Icrn
         YxqVUD1WnndLnSlq6/GXCQErs3A2oDkr0FsERVxRfaV6roIbkpzhPOEEioMtjbesfhwG
         R4K9fdqIq4STgE1JQLnw6nydLf5e1FNodVVcNu9lDi1BD/ksRpnaikM1RslEAqOAdK4P
         hFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728634145; x=1729238945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WRD3jbo/tTNYRziqpYEKDmK590mjZZMZmbwUA+4tqc=;
        b=bl3M6uqieO29Nb42QaW4tXGegwwFEqp3gkaFrdPypeuLWeNFAy9TGhS7Ssfi3t2N1G
         6uPKS/zAWUnQQB8Yicim4IJsiklyyLNjHAG6hEgRYgCAGF3mVR9fiQdt1ulrm/ASSwOD
         CUkteLXbU2zuu7oZA58M8Q6IN4vcs+W+Fwvb7QRnLO89Q/KFxzYp5A6l9zVWsH5xf8kM
         J/UjM1WP7tszK0ceTKrLeBX1LZEnXQpI+H+TNuFGPoajoDStkFIyJE80i9Dc/mkMEChX
         5f0GE8YOuSDxtFab4txNh0Braxu6VeEyw7vucMY2JgtXMO/aP1WG32WSD7rK6eHOUdi6
         GNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWJOW/X+Y1e32cTl2b8lw5heIQnV0lUbv3KRO+qT+NwisJKsE0vfXxiORVxje76cD6IjlMzlZDVEqmEWI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJEC/PmTuYZnl18tsNWrWimEIVVj5psLzvHbtVrGSbu6wV4nPl
	1b1BfkwSw8vmTyew1K0hx4Y7Rw3wbE6HlaRzYc5zeUezclGhxaISdWNRV0BNAnvLjEIKDTOhytI
	UB/bNNQju0jstu543EIgbpuh8pRru0/C1/vubOQ==
X-Google-Smtp-Source: AGHT+IHpBFNUg8lPaFZMK3Ci4US3g+WGiRqAJyR4Scr9ecI9A0vw9GhKESir6HVhQexRmf14eQePLKnaGmCv96bAcYM=
X-Received: by 2002:a17:90a:3041:b0:2e0:8780:ecb with SMTP id
 98e67ed59e1d1-2e2f0af2eaamr3042702a91.12.1728634145262; Fri, 11 Oct 2024
 01:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241010112337.3840703-1-naresh.solanki@9elements.com>
 <172857036038.1533242.5775916298170949713.robh@kernel.org> <4d596ac9a2215be8510369c948e0b9680ee2fce3.camel@codeconstruct.com.au>
In-Reply-To: <4d596ac9a2215be8510369c948e0b9680ee2fce3.camel@codeconstruct.com.au>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Fri, 11 Oct 2024 13:38:52 +0530
Message-ID: <CABqG17gmjvBmpp2a7tgVwR+q3tsrbejVmezWaXH__txytr30hQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andrew,


On Fri, 11 Oct 2024 at 05:15, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Naresh,
>
> On Thu, 2024-10-10 at 09:30 -0500, Rob Herring (Arm) wrote:
> > On Thu, 10 Oct 2024 16:53:31 +0530, Naresh Solanki wrote:
> > > Document the new compatibles used on IBM SBP1.
> > >
> > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > Changes in V4:
> > > - Retain Acked-by from v2.
> > > - Fix alphabetic order
> > > ---
> > >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> >
> >
> > My bot found new DTB warnings on the .dts files added or changed in this
> > series.
> >
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to reply
> > unless the platform maintainer has comments.
> >
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >
> >   pip3 install dtschema --upgrade
> >
> >
> > New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-sbp1.dtb' for 20241010112337.3840703-1-naresh.solanki@9elements.com:
> >
>
> ...
>
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mux@77: interrupts: False schema does not allow [[44, 4]]
> >       from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> >       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>
> These still must be addressed as mentioned on v3 (with more specific
> comments regarding the infineon,ir38263 on v4). Please look through the
> binding documents for the affected nodes and make sure the nodes in
> your DTS conform to their definitions. You can check your work with
> `make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-sbp1.dtb` prior to sending.

These are the warnings coming for trivial devices. Even for regulator@5f

grep -rsn mp2973 Documentation/
Documentation/devicetree/bindings/trivial-devices.yaml:286:
# Monolithic Power Systems Inc. multi-phase controller mp2973
Documentation/devicetree/bindings/trivial-devices.yaml:287:          -
mps,mp2973

I've rebased it on top of for-next branch in [2]

I rebased on top of [1] & the volume of output did reduce for CHECK_DTBS.

Regards,
Naresh

[2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
>
> It may help to base your series on top of [1] to reduce the volume of
> output from CHECK_DTBS=y.
>
> Andrew
>
> [1]: https://github.com/amboar/linux/tree/for/bmc/aspeed/dt
>
