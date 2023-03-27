Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65A6CA8C8
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Mar 2023 17:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Plbzp3Rtbz3f6k
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Mar 2023 02:18:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.182; helo=mail-oi1-f182.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Plbzh6wdZz3bWj
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Mar 2023 02:18:07 +1100 (AEDT)
Received: by mail-oi1-f182.google.com with SMTP id r14so926696oiw.12
        for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Mar 2023 08:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679930284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUSCOsxTscJFykA96S2HHz11yN7G7jVkej50uNItSXY=;
        b=Chqn5N9gT7nP8jgIR2mBkNz/GJSM4o7Vae+leRTd7tMrgPpdHJJX1AphfpA4/OvHR/
         SOmQt4u6IfzGY/u1hM0OnDuwTLTZ74obyv2KQQrYWQcM/4xfPerUJkIYlrrenE1nIOE+
         i1cHql8rKcHdzYP++Dx1Z9C/EzPETrKgHXIG+2HRhdWAZdPcOLrrB8yQS+YgxhNa0+QH
         f/erVcv8cnCmYBY0Zz3hhMectqBblvICmi8fwSz6bItDOhMc601GkiaOD7LuD6qrR9Wk
         Qw8fPgMbqhc9RunIdb2xXrfHL2IpkC+hzD16dB4J2LGkWPjvLYYGn2F/pSGJeGch9LuT
         82OQ==
X-Gm-Message-State: AAQBX9f2qIt6sg+qklaplwngTSjKnb/s7D3SonnrQcjDhD1lievosp8Z
	ZnvwKue9vwhdYff/qqO5RQ==
X-Google-Smtp-Source: AKy350aYr658iaouhuPMz5BUi/6LPvCml2JNjfTHY3Dd+GRk2+ni9Tm9z1RVzieyWuXYsh0ctaPzTA==
X-Received: by 2002:a05:6808:93:b0:389:1601:fb7 with SMTP id s19-20020a056808009300b0038916010fb7mr2090348oic.51.1679930283810;
        Mon, 27 Mar 2023 08:18:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z6-20020a4aae06000000b0051763d6497fsm11218156oom.38.2023.03.27.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:18:03 -0700 (PDT)
Received: (nullmailer pid 3893016 invoked by uid 1000);
	Mon, 27 Mar 2023 15:18:02 -0000
Date: Mon, 27 Mar 2023 10:18:02 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] doc: Add Atmel AT30TSE serial eeprom
Message-ID: <20230327151802.GA3485600-robh@kernel.org>
References: <20230321151642.461618-1-eajames@linux.ibm.com>
 <20230321151642.461618-3-eajames@linux.ibm.com>
 <6d4cf513-0787-6b39-8d38-30484be7ddff@linaro.org>
 <baf7ad36-0410-3063-7960-8dd7040fb8fd@linux.ibm.com>
 <5993d93e-f57b-51aa-85a3-f58ca0cf846d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5993d93e-f57b-51aa-85a3-f58ca0cf846d@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Mar 21, 2023 at 10:55:43AM -0500, Eddie James wrote:
> 
> On 3/21/23 10:46, Eddie James wrote:
> > 
> > On 3/21/23 10:19, Krzysztof Kozlowski wrote:
> > > On 21/03/2023 16:16, Eddie James wrote:
> > > > The AT30TSE is compatible with the JEDEC EE1004 standard. Document it
> > > > as a trivial I2C device.
> > > > 
> > > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > Use subject prefixes matching the subsystem (which you can get for
> > > example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> > > your patch is touching).
> > 
> > 
> > Oops, sorry, will fix.
> > 
> > 
> > > 
> > > > ---
> > > >   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > > b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > > index 6f482a254a1d..43e26c73a95f 100644
> > > > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > > @@ -47,6 +47,8 @@ properties:
> > > >             - ams,iaq-core
> > > >               # i2c serial eeprom (24cxx)
> > > >             - at,24c08
> > > > +            # i2c serial eeprom (EE1004 standard)
> > > AT30TSE?
> > > 
> > > > +          - atmel,at30tse
> > > Microchip does not find anything on AT30TSE. Are you sure this is the
> > > model name?
> > 
> > 
> > Yes: https://www.microchip.com/content/dam/mchp/documents/OTH/ProductDocuments/DataSheets/Atmel-8868-DTS-AT30TSE004A-Datasheet.pdf
> > 
> > 
> > Maybe it's actually an 8868? Or should I include the 004A as well?
> 
> 
> I found some other AT30TSE (AT30TSE752A for example) devices that do not
> appear compatible with the EE1004 standard, so I will include the full model
> number.

If this standard is sufficiently complete, then you might want a EE1004 
fallback compatible. Complete would mean power supply(ies) and any extra 
i/o are defined and the exact device model is discoverable.

Rob
