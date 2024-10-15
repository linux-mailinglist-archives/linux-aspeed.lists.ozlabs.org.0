Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141F99E2EF
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 11:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSTby1nT3z3bsJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 20:40:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728985228;
	cv=none; b=OHYz1rpqN2X13i3GpDS3qJUl4StxDIxVLuFHw/4Cjd95iIZhdksYyHZeat8B9FjKdEUrF3vFt0R4l/N8/z3ezWahADtj1f9c+1YQLfMGDrJ9kBvRzVhAc30iTYyVQhfR93c8PypiQ0iagVtxcmqDi96kJuuy5s2lkee4qz8/Pi5UOAVeEisiPfihj8JPnlO+9CeEpOwmYIp6ZLI7iXzW6sv9D4yvDGnPHhKX0ynJkJ2LUBFKqcgXjT7SvieRYHXGF/kIKKQHN6R+8MyYc3UB/zvC7GFCIxcvd4COtuw5/hJCGmCb5jnN/dmiuRygu5cXnFpBWIL7FvHJCrvemnaa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728985228; c=relaxed/relaxed;
	bh=0odRJi4e9UP6nWytcjiH6A/NCc2DC743koxdsYHVSec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5VoYAa4lHJJvGtSEJ0Tv2+exm9orl/jWw9kUimDh7m7oo4YxRSZccSuGXcf7/DU+aGEwYT99gfAciTJ1sy9wS2tI4GwDNQY35PABEL2bJrRftbPZaMywtdZAnzv3Bm5gC4VpKZY1OeD5MDSaV/DS6AFm91Qw5NZo3lPg67vAInK91km6xJOMaQ/4XyuWQ68E4PTGJKvZ23ryaUy9k0uzs3UBs/bxGTFw9yDyU7oiZlt39aGcux/uT1io1uiIrDi4VlD0Ei1Mbog4KuUxvGTkQqxIerutiVTxpjJXsWLXITG4YvAgd3SIhAfmcsfO9bXiZLUpgGwhmEMBE1+hH43Rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=TwNqJa+4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=TwNqJa+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSTbv4Ldqz3bkL
	for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Oct 2024 20:40:25 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso2937412a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Oct 2024 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1728985222; x=1729590022; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0odRJi4e9UP6nWytcjiH6A/NCc2DC743koxdsYHVSec=;
        b=TwNqJa+4Tljj1xOnby1IBdaD7dPIMpFHRD5OHQbTkLu3iEjd/dP5qmVxKzxCwirXHv
         Hr80PzCFVWZCPccRLHEJ9en6qqpqjtQfLP9WQToq3BO842/SEHGcxkvria+m9/hktAIK
         2bR/KWlG+2PiDUhWx9rjtPvTJE2B8P8pYsDcKbquPN14pYhg7RvM2dx+XNsyiikd88Hw
         sQf3INzoA/HmhuS1xWSO1HqWdscStVQ4L4304aR4dbq9wOaGtPuyPh3jve5Bc5ciiVi8
         1imTKbFvKZGQ8+cpsPbo1Mr7VOlkmjuHZYCqS9NNGihd2v+Te0itFK03HI6FSgqsobrl
         pYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728985222; x=1729590022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0odRJi4e9UP6nWytcjiH6A/NCc2DC743koxdsYHVSec=;
        b=Imjii/Fgj2ZI4louRBLmegBi3/oGgocHKa6LUAxFmKmCEhdFOtnMpleYyoEtxfm4b8
         4hznwsHLdOY70Je4KgGFxQsg+E1qLfTX4srh5yZu/96TGc8IebQGGqMQMoYw0FKfs6D4
         zANnec2ooad3KbcH4eiNq2D6csu/AFkiPB/rJ6wqYFWq8SQ57wYTmQzXHl4Z/vFmXiRl
         MBcewUYjjYH364sa6Dm8OOX5TRSnU25S1aEYm8ixAV/6dZQaAJblJmRZbAn8hf04iemy
         uHFmY6vWymBOYJlf+YEZan7ro9spQ8D3oMpDH+k9x2xxpyfrI8E3zZy/E4T+VCiuaJHM
         E/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjTDFyGFYgICbOVfzcMBpdIrI2D8JCl3ysRtqdkOHw7+vJuHVYBwZSB5BAfOENaPWppJbqA0M+PWyJ4oA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxC7KnmAzyW1Hgxc3l2pkBN4/J8IBjh1MOe8htArCXRxU8sr0Tg
	bNGRK/ZGsK+aBaCIPwUG8Vc8ELyuWZI5qguA4r2snqoarmXLQbcovGNDSgJaXYH0nrPXAs7gT4s
	xxIRRQsm4oYBUj+aBdX1o8JRDKjbjdNtOUF+ELA==
X-Google-Smtp-Source: AGHT+IF3+W3l2NbmiDb7THGeOKPUra1IxKZZTIVZtQaA9zttfX3iwZabD0hHcuUB7HHNoAXudsZ5EZlbjm8YXFH2dcg=
X-Received: by 2002:a05:6a21:1789:b0:1c4:9f31:ac9e with SMTP id
 adf61e73a8af0-1d8bcfc21f5mr20687458637.42.1728985222426; Tue, 15 Oct 2024
 02:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241010112337.3840703-1-naresh.solanki@9elements.com>
 <172857036038.1533242.5775916298170949713.robh@kernel.org>
 <4d596ac9a2215be8510369c948e0b9680ee2fce3.camel@codeconstruct.com.au>
 <CABqG17gmjvBmpp2a7tgVwR+q3tsrbejVmezWaXH__txytr30hQ@mail.gmail.com> <5ca25b137b955dc5e0d9607df104097e3de7b782.camel@codeconstruct.com.au>
In-Reply-To: <5ca25b137b955dc5e0d9607df104097e3de7b782.camel@codeconstruct.com.au>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 15 Oct 2024 15:10:10 +0530
Message-ID: <CABqG17j1-Vd6qN_En7ATjPBOuSgGTgvVNimj++H+bFasEnwXnw@mail.gmail.com>
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

Hi Andrew, Conor,


On Tue, 15 Oct 2024 at 06:08, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Naresh,
>
> On Fri, 2024-10-11 at 13:38 +0530, Naresh Solanki wrote:
> > Hi Andrew,
> >
> >
> > On Fri, 11 Oct 2024 at 05:15, Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > Hi Naresh,
> > >
> > > On Thu, 2024-10-10 at 09:30 -0500, Rob Herring (Arm) wrote:
> > > > On Thu, 10 Oct 2024 16:53:31 +0530, Naresh Solanki wrote:
> > > > > Document the new compatibles used on IBM SBP1.
> > > > >
> > > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > ---
> > > > > Changes in V4:
> > > > > - Retain Acked-by from v2.
> > > > > - Fix alphabetic order
> > > > > ---
> > > > >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > >
> > > >
> > > > My bot found new DTB warnings on the .dts files added or changed in this
> > > > series.
> > > >
> > > > Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> > > > are fixed by another series. Ultimately, it is up to the platform
> > > > maintainer whether these warnings are acceptable or not. No need to reply
> > > > unless the platform maintainer has comments.
> > > >
> > > > If you already ran DT checks and didn't see these error(s), then
> > > > make sure dt-schema is up to date:
> > > >
> > > >  pip3 install dtschema --upgrade
> > > >
> > > >
> > > > New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-sbp1.dtb' for 20241010112337.3840703-1-naresh.solanki@9elements.com:
> > > >
> > >
> > > ...
> > >
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mux@77: interrupts: False schema does not allow [[44, 4]]
> > > >  from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > > > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >  from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
> > >
> > > These still must be addressed as mentioned on v3 (with more specific
> > > comments regarding the infineon,ir38263 on v4). Please look through the
> > > binding documents for the affected nodes and make sure the nodes in
> > > your DTS conform to their definitions. You can check your work with
> > > `make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-sbp1.dtb` prior to sending.
> >
> > These are the warnings coming for trivial devices. Even for regulator@5f
> >
> > grep -rsn mp2973 Documentation/
> > Documentation/devicetree/bindings/trivial-devices.yaml:286:
> > # Monolithic Power Systems Inc. multi-phase controller mp2973
> > Documentation/devicetree/bindings/trivial-devices.yaml:287: -
> > mps,mp2973
> >
>
> Right, but if they're generating warnings, then you haven't specified
> the nodes in accordance with the bindings. From here one of two things
> is the case:
>
>    1. The bindings' specifications are incomplete, and you need to
>       introduce patches updating them to match how you need to use the
>       hardware
>    2. Your devicetree is incorrect, and the unexpected properties need
>       to be removed from the listed nodes.
>
> The only third option is "don't use the hardware how you need to" (i.e.
> remove the unexpected properties despite needing them, because you
> don't want to update the bindings).
Will do what needs to be done.
Will introduce binding for those devices which need them.

Thanks a lot for your inputs

Regards,
Naresh
>
> Ultimately the tools are telling you something is wrong, and I need the
> warnings I've identified addressed before I can apply your patch,
> otherwise the hardware is not going to do what you might expect.
> > I've rebased it on top of for-next branch in [2]
> >
> > I rebased on top of [1] & the volume of output did reduce for CHECK_DTBS.
>
> Great :)
>
> Andrew
