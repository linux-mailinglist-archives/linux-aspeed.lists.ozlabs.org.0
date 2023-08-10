Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3C5776F9E
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 07:34:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PbzSQIZg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLwbW0GMFz3c3d
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 15:34:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PbzSQIZg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLwbM4Vqwz2yTv
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 15:34:21 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so386735b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Aug 2023 22:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691645657; x=1692250457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ/qlSLIcUxObxGvaa3+l+dyeznB23BNm5Ew/rAC/3E=;
        b=PbzSQIZgaHMyqYIiTzTtaLNvgEWOfUaqcUUgWPFNfggsyfMCw4uYCuHH8jyQp8yPL2
         6g7TckppbfKe1/EdP+iL7DHyKvNZbXFNuHwwSQ5Ry5WA/ccAO2HYX1WLT3A02pvqLpkV
         yQBdNWOFa6eAxPqmPj3cywvJ0J0V94hxS4/OGSeH9H7msw/m5ne61RVAPyfbDLSEFrIg
         ZYIM3pXGN6Bn7gF5ZxINsTZRJIsGdkXIgKxXXAnUbR5o2Xi92ohnrFBya2v0nwutql14
         O4gKuPaa81QMNg/G2v1ZkpbmIWiW48mAxMpVSvxS1csgXCedULy5dJDikb28Ydz35q6Y
         p3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691645657; x=1692250457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ/qlSLIcUxObxGvaa3+l+dyeznB23BNm5Ew/rAC/3E=;
        b=QvyUF3OStGZrSZhrJMFjxkgFFbIMyTAajGXNPG8JMZ/i3vfwrrXvHtETQYCCiYx6Gg
         qec8kvANPwS6geNT0sL6lOL5dL1++IB32I56UrUbF9t9OXgEfufsKKBta4BuL0kFRDrv
         7q5M2/EqxPiL4T4AIU+V67Mry72LhC82Y/jRHIWgHc/u/GBDbJ9iBZkzw82m5HRwotXs
         3amvi+JNNJm/NGFWLiztVTX8cBXkb7ieStGB5qVyqTdAsZtih9sf31R2mmq4DEeExU1z
         pfg16C7JZl6o/1baBthgQHhsGSGg31nW3s/si4d32t13V64ppfmDLmp9HRvez0U6NDQl
         9cjw==
X-Gm-Message-State: AOJu0YzgRS3pYw4/7k/0433HMnp1Ki2I/eL28wHwDLt18Gd8vra/72Jc
	WALi86hb8ClyrVs4pnot09s=
X-Google-Smtp-Source: AGHT+IHh16fXJbza6krjS7CGESW9rSgpuPrLYYWfJLz6uxyHaFLZorobjYqBAFF1zYJq2ILEvNtejA==
X-Received: by 2002:a05:6a00:17a5:b0:666:b22d:c6e0 with SMTP id s37-20020a056a0017a500b00666b22dc6e0mr1446781pfg.11.1691645656636;
        Wed, 09 Aug 2023 22:34:16 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.59.39])
        by smtp.gmail.com with ESMTPSA id c16-20020aa78810000000b00687933946ddsm569271pfo.23.2023.08.09.22.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 22:34:16 -0700 (PDT)
Date: Wed, 9 Aug 2023 22:34:13 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Fixup Wedge400 dts
Message-ID: <ZNR21UVdfxlvpZAt@taoren-fedora-PC23YAB4>
References: <20230803230324.731268-1-rentao.bupt@gmail.com>
 <CACPK8XcFL7kM1yaA0+ZRSt27a0yreO+AH5cXtSk1TyjqyjH1WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcFL7kM1yaA0+ZRSt27a0yreO+AH5cXtSk1TyjqyjH1WA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, taoren@meta.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

On Wed, Aug 09, 2023 at 08:08:12AM +0000, Joel Stanley wrote:
> On Thu, 3 Aug 2023 at 23:03, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > The patch series fixes a few entries in wedge400 device tree.
> >
> > Patch #1 sets spi alias in ast2500-facebook-netbmc-common.dtsi (included
> > by wedge400 dts) to make sure spi bus is consistent with flash labels in
> > flash layout.
> >
> > Patch #2 enables more ADC channels in wedge400 dts.
> >
> > Patch #3 sets eMMC max frequency to 25MHz in wedge400 dts.
> >
> > Tao Ren (3):
> >   ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi
> 
> I wondered if we should do this in the aspeed-g5.dtsi.

I also hesitated if I should do it in aspeed-g5.dtsi, but I didn't do it
because I was not sure if others care about the spi aliases.. Should I
send out v2 to move the alias to aspeed-g5.dtsi?

Cheers,

Tao
