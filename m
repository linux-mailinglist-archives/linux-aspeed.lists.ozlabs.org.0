Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E89647754D8
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 10:13:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AMgXDFq7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLN905wd3z30Py
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 18:13:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AMgXDFq7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLN8t6v9Wz2yVN
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 18:13:01 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9936b3d0286so966293466b.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Aug 2023 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691568778; x=1692173578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvmzhOT0wFGeuwQD5W6OcK5p6BUWlzFV8CC/4rBnjJA=;
        b=AMgXDFq7pjWEBU8dkhRBJbmyzqO0B7VOChoTNgi6+nIAXmwSG6nso3Rxos4XuMIfBl
         gwcPgZQE3nekC5ZpD0LEzQG4bVm7bbEvMxeRXaga66f+OVpDb2aUVSCnwVYRNPk1iUUd
         8QX3VfJ5rR4hJB1aewiTEoVwArTHPEOdxvZVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568778; x=1692173578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvmzhOT0wFGeuwQD5W6OcK5p6BUWlzFV8CC/4rBnjJA=;
        b=hSfWtYV7BL68a9yEHEGQF48Q1bNvhNlbMYraBVLBem4h74jAzUfUhCFoNXg/opceBz
         ty0spYyjidsAvLgFReT78mda7GJSNCtMWb7aEuMKG9x8d8lgP5ntjDubzar6ywISyLga
         NlbbwNZOvOfo3YkKOXKtVIyTh4QC8JXXKh3RO71Lh85joMhqfNwaTtgHRmHr0VmbS5J/
         ucy7tSm5rDrlzn5Pl/yDoy+4BaT0aaKYh5anrnSyIDWyIjZf3H9WZNoNJG8vjNqhDhMu
         CNU0j1EoY0MdKMOLC/15+PdHbT5xreFcGekLs6Zp/HAk7J98jWT6zLx5k0m6Ool9qOC3
         CIpw==
X-Gm-Message-State: AOJu0Yx8fUtcsscojPipgMKA03Y/Scm/hVXWKNEgURIzBwU7as57kAlg
	EzcAglpnEr2g0OzO2qhRBpYo/l2GAp8XRRbVXlk=
X-Google-Smtp-Source: AGHT+IHcUqgd/upyc5Qjp4q1hsetXyRqL9GbYN9PhYyu2O4YkqPjbQELGDAbkFXJfWlqQ62KQIfeg7AyIXgmm6wkV/g=
X-Received: by 2002:a17:907:788e:b0:99b:6c47:1148 with SMTP id
 ku14-20020a170907788e00b0099b6c471148mr1620721ejc.3.1691568777601; Wed, 09
 Aug 2023 01:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230808084248.1415678-1-Delphine_CC_Chiu@wiwynn.com>
 <20230808084248.1415678-3-Delphine_CC_Chiu@wiwynn.com> <CACPK8XfFWC-wxCt4DwNRNctXap5qiZUz-utcbpnp0vj=Z46=9Q@mail.gmail.com>
In-Reply-To: <CACPK8XfFWC-wxCt4DwNRNctXap5qiZUz-utcbpnp0vj=Z46=9Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Aug 2023 08:12:45 +0000
Message-ID: <CACPK8XfwcsnrrF9YJ7y-sLRx1OWfrvhNi2G3Tbhww_dXfSOUXw@mail.gmail.com>
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

On Wed, 9 Aug 2023 at 08:05, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 8 Aug 2023 at 08:43, Delphine CC Chiu
> <Delphine_CC_Chiu@wiwynn.com> wrote:
> >
> > Add linux device tree entry related to
> > Yosemite 4 specific devices connected to BMC SoC.

There were also some of these annoying warnings. Please try to fix
them up in your next version:

../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:460.4-14:
Warning (reg_format):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0:reg: property has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:510.4-14:
Warning (reg_format):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1:reg: property has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:567.4-14:
Warning (reg_format):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@73/i2c@0:reg: property has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:578.4-14:
Warning (reg_format):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@73/i2c@1:reg: property has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning
(pci_device_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning
(i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: Warning
(spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:457.9-505.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0: Relying on default
#address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:457.9-505.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0: Relying on default
#size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:507.9-555.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1: Relying on default
#address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:507.9-555.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1: Relying on default
#size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:564.9-573.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@73/i2c@0: Relying on default
#address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:564.9-573.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@73/i2c@0: Relying on default
#size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:575.9-584.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@73/i2c@1: Relying on default
#address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:575.9-584.5:
Warning (avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@73/i2c@1: Relying on default
#size-cells value
