Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA571776FAC
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 07:38:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SmRBM0pH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLwgb3bKbz2yZV
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 15:38:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SmRBM0pH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLwgV0WNZz2yVn
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 15:37:57 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bc512526cso77203466b.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Aug 2023 22:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691645874; x=1692250674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lJU5YQvAO9o1YPXgG3GEfP38+VAVljddeHXmD0s3+To=;
        b=SmRBM0pHqxhUxDkuJubeJKc32WakenwHjlOXpgLfV7QrkdP9nlNcb9MPkm9Ct2hU4o
         gjZHPaEt9qN24qQqfNg3451ij21yeDL04zZ31VYVo6PtKVt+Fa4DkDPBJgDHLU+Ci6ZP
         R9XMCuqz6zPwfA3MfKP/SeJmtGPcS27uVuvV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691645874; x=1692250674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJU5YQvAO9o1YPXgG3GEfP38+VAVljddeHXmD0s3+To=;
        b=E9YMmIexLLziQXw0vBAuH8WI3IhCeGDivaetved8u0fUx5D60mEr3ZyTg3LGWljqEw
         5pddI2lyBd4bgfTF9sVVktvE/QBgH0vILQjKSOESE3g7GTc35rDxl5exNeYBwTwkLfIY
         K9rU2mzIgC1oHus3TaRvCKKYAcqNHTWP+KhYZQsT9gCNqiuEKvYqoQcbN7hpfuAfYtdO
         vz7NPkurGs19Pm4+1urElfBCQ/2PyJD5LEeAhuWS6FWF1fognmCvJSePbjHBabCQnX5g
         I1DlUO8b9US49fCDrlwPWAzlBMwA6oFBQ35Bhj9sKs22M9KilCkQKHSZdNqTtq87UYjU
         XGdg==
X-Gm-Message-State: AOJu0YwcQ8r1IJAPfntwnzja88hJJbsIyhcXxz3MiZchJyNmiVSrstd+
	sSijpbBD+bciZVi2o9OZIL4YT7BP0svwtc2m6WI=
X-Google-Smtp-Source: AGHT+IGrfL4fOH5vFONn/79nJI0W1AWuAqGCJbUK3J56DaMcGhdU/Nz5GNJsgwxztB1ohi2x1a8/HmAZijuqz5dhH/o=
X-Received: by 2002:a17:907:2c59:b0:99c:c6b7:65e4 with SMTP id
 hf25-20020a1709072c5900b0099cc6b765e4mr886404ejc.77.1691645873918; Wed, 09
 Aug 2023 22:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230803230324.731268-1-rentao.bupt@gmail.com>
 <CACPK8XcFL7kM1yaA0+ZRSt27a0yreO+AH5cXtSk1TyjqyjH1WA@mail.gmail.com> <ZNR21UVdfxlvpZAt@taoren-fedora-PC23YAB4>
In-Reply-To: <ZNR21UVdfxlvpZAt@taoren-fedora-PC23YAB4>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2023 05:37:41 +0000
Message-ID: <CACPK8Xd7LpMuVC63PSfcLmXf4wRThMNRYr9vRxZh246+-DUFFA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Fixup Wedge400 dts
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, taoren@meta.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Aug 2023 at 05:34, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> Hi Joel,
>
> On Wed, Aug 09, 2023 at 08:08:12AM +0000, Joel Stanley wrote:
> > On Thu, 3 Aug 2023 at 23:03, <rentao.bupt@gmail.com> wrote:
> > >
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > >
> > > The patch series fixes a few entries in wedge400 device tree.
> > >
> > > Patch #1 sets spi alias in ast2500-facebook-netbmc-common.dtsi (included
> > > by wedge400 dts) to make sure spi bus is consistent with flash labels in
> > > flash layout.
> > >
> > > Patch #2 enables more ADC channels in wedge400 dts.
> > >
> > > Patch #3 sets eMMC max frequency to 25MHz in wedge400 dts.
> > >
> > > Tao Ren (3):
> > >   ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi
> >
> > I wondered if we should do this in the aspeed-g5.dtsi.
>
> I also hesitated if I should do it in aspeed-g5.dtsi, but I didn't do it
> because I was not sure if others care about the spi aliases.. Should I
> send out v2 to move the alias to aspeed-g5.dtsi?

I wasn't sure either. Lets leave it as-is, but if we see other systems
wanting similar numbering then we can put it in the common dtsi.

I've applied this to the aspeed tree now.

Cheers,

Joel
