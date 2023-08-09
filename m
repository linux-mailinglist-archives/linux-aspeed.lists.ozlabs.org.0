Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0752D7754E5
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 10:16:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=arzzc1jK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLNDX6St5z30PN
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 18:16:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=arzzc1jK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLNDR5jyPz2yVN
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 18:16:07 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5236b2b4cdbso151888a12.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Aug 2023 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691568964; x=1692173764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SsMnenAL2XwJ0YGncKUNQOfBNyYjVIIZqLk1J5TzuGA=;
        b=arzzc1jKJBkATQwIpDm3Kc++X1xrfcvQ2jcjRNyVjP6f9dVhuXoeVZs6RbOynGXlAe
         bmNe2NN9Aj3IahSgPGllWFZMjNWTsIhmhTCZ3+D+gy0sZ2JU/aqjucK4A0dbp4OvsmEr
         9eZFqGS2tf1xSdegboD2fgvuXLFwtC5ZrFBDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568964; x=1692173764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsMnenAL2XwJ0YGncKUNQOfBNyYjVIIZqLk1J5TzuGA=;
        b=c/nv1JahgAcqn9/kPwqUBN98iVyb3EEio562iK/cDKI/vQDoJ4QO02MlERj+IhzhnZ
         u/afg7PK2VVUNU1TsgQmWklNVWmDWyX9X5BHjfacpv0stnGvPREZ/RJV97Zx46rs6i2r
         XElkEG2D1rgXcutUJXDF69AltXuqg9Wsdg+KW+WjwxtrBsB3xXZj8quk8NkX5hejGpyg
         492GSC/COIiadchp2WTLN1DFGEu5pfU5fgZVG/d75Bj2NBCiwLeC09cOeY9g+7dPfng9
         J/4r0FyPZ5Ixgvm2K7xD4xfRkPlJUD+Dfipd1xlFQ4ei7/k7lUovb1c0Jx9aRazsVFqM
         oWbg==
X-Gm-Message-State: AOJu0YwJaUGlxQbUVtmpdunirUQLIqcuxtqF0RkFcrx6nkVDKl/z6nGI
	AGr2m2Vw4XlPWMbHVAcuhOcyEWLiTyIjrsC+bJc=
X-Google-Smtp-Source: AGHT+IGxc7yyRYTXwRGeQCujkNredm8KgAtkyiBFjjjrcfWcnHiAlPtRiEoyNV/Y8OkHrSV6ZAxEvyj4GFpNmfELezs=
X-Received: by 2002:a17:907:7614:b0:993:d5bd:a757 with SMTP id
 jx20-20020a170907761400b00993d5bda757mr1430906ejc.19.1691568963742; Wed, 09
 Aug 2023 01:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230808084248.1415678-1-Delphine_CC_Chiu@wiwynn.com>
 <20230808084248.1415678-3-Delphine_CC_Chiu@wiwynn.com> <CACPK8XfFWC-wxCt4DwNRNctXap5qiZUz-utcbpnp0vj=Z46=9Q@mail.gmail.com>
 <CACPK8XfwcsnrrF9YJ7y-sLRx1OWfrvhNi2G3Tbhww_dXfSOUXw@mail.gmail.com>
In-Reply-To: <CACPK8XfwcsnrrF9YJ7y-sLRx1OWfrvhNi2G3Tbhww_dXfSOUXw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Aug 2023 08:15:51 +0000
Message-ID: <CACPK8XeUbaMhST73UUT7BZzb2ajVU-M7yfQfEkmX2J=pzk=Tiw@mail.gmail.com>
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

On Wed, 9 Aug 2023 at 08:12, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 9 Aug 2023 at 08:05, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Tue, 8 Aug 2023 at 08:43, Delphine CC Chiu
> > <Delphine_CC_Chiu@wiwynn.com> wrote:
> > >
> > > Add linux device tree entry related to
> > > Yosemite 4 specific devices connected to BMC SoC.
>
> There were also some of these annoying warnings. Please try to fix
> them up in your next version:
>
> ../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:460.4-14:
> Warning (reg_format):
> /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0:reg: property has
> invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)@@ -450,6 +450,9 @@ eeprom@51 {

This silenced most of them:

        i2c-mux@71 {
                compatible = "nxp,pca9846";
+               #address-cells = <1>;
+               #size-cells = <0>;
+
                idle-state = <0>;
                i2c-mux-idle-disconnect;
                reg = <0x71>;
@@ -557,6 +560,9 @@ gpio@61 {

        i2c-mux@73 {
                compatible = "nxp,pca9544";
+               #address-cells = <1>;
+               #size-cells = <0>;
+
                idle-state = <0>;
                i2c-mux-idle-disconnect;
                reg = <0x73>;

And then this fixed the remaining one:

@@ -423,7 +423,7 @@ power-sensor@42 {
                reg = <0x42>;
        };

-       power-sensor@41 {
+       power-sensor@43 {
                compatible = "ti,ina230";
                reg = <0x43>;
        };


Please fold in these changes in your next version.
