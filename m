Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 617247A4134
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:30:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z2z8bZOt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0Z22XDz3cCh
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:30:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z2z8bZOt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm2dZ74Slz3df3
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 00:19:30 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-649921ec030so38116656d6.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694614767; x=1695219567; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ccpm8M63tUVRb8cHltFDbsSiHscuT20er3PFEGjsiBE=;
        b=Z2z8bZOtGeENGigW83TbEvjkjCKIQadv1GEYQeU4tgTOMThVGk3GnzrPjHRxCsBtCp
         utFJgVAsqbqn2n14mXtFpTMsM7w7WGTzjdSko2TudiyN2BE0JGQ5iG9Q13i9n0z5X9+G
         KRWo/5EIVzyF9Y3zwd61iv111LpgPOuKv0Nw7NLxH6hR5hxxygS5kaxVfzSuV1djzpre
         UIqU5pBS8Myp7v25gkfmZMDrqf/78ebGVG2rPpUw0Bf3rlIWaAe12CT+ezCm/rQ1tK/F
         Saxc97jdJV3tTHfEmhyL/diGeei3Hj66yMSZN5uDMnyT94wJMNBS1+DSmgc427n4sFVw
         M5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694614767; x=1695219567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccpm8M63tUVRb8cHltFDbsSiHscuT20er3PFEGjsiBE=;
        b=XJs4JVgHHJgwBHE2Q3u/ISjslIxDDVhreuNzGq3B7huTdyaeW1X604vXV0CZkSv0VS
         QIMGnZUKii4rfibEhgbdIcNKKeWDtGdmNxtpUuTi7O+ObNYTW61S7bQRSuJaFdegt+xI
         Rcug/mtw43lb90QR+5UTZPjNsKksInjRVZjQr9Io8AZOG2ZvXtgRHdAEh2dy4IQ2a7K0
         9N3ixsAO3g9191fOvKVz9auiMiLQH3RD/3G2L7YXdm7dAHa4FE3v7cEuF2IP4mKG+tZ7
         fJTo9ebFdhio4LsRygqNvosaivyHOUC5Jxbvenmo+2078A5IStwA7JtVgUzsujwHolBa
         +3fg==
X-Gm-Message-State: AOJu0Yy7Pbozfq17LD6W0ZJeNgdnNmmoTxgnMp7Ui1oR8Onr/rkSOX76
	g7pBy7l1AWgFPYZrPYDm2mOZ/XUdbUOoTaQUDxM=
X-Google-Smtp-Source: AGHT+IFo1VDju5+RiN1hu/MS6i6AKwAXlvWCwJjHPS8cruvNNP/FSBt27kTgEjJDuN5FKtcGF2oBBFdq/A3wg7SPo8I=
X-Received: by 2002:a05:6214:5c06:b0:655:dc84:d744 with SMTP id
 ly6-20020a0562145c0600b00655dc84d744mr2477721qvb.25.1694614766962; Wed, 13
 Sep 2023 07:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-2-yangchen.openbmc@gmail.com> <26a53f62-d8d0-9583-e675-a3db99c60c8a@linaro.org>
 <CALFa7M_Gov4jd3wxrXWhxuPKbDr+cp8xmuWJCQH_N=a+q03M1A@mail.gmail.com> <605e4577-1e01-cd0b-9d42-34401bd7f3a7@linaro.org>
In-Reply-To: <605e4577-1e01-cd0b-9d42-34401bd7f3a7@linaro.org>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Wed, 13 Sep 2023 22:19:15 +0800
Message-ID: <CALFa7M9uaFuX4OEy9XdRa7xtKECOvJvg=MH_jkJ+jrfRe4M_SQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: document board compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie.Chen@quantatw.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> On 13/09/2023 11:52, Yang Chen wrote:
> > Hi Krzysztof,
> >
> > Thanks for your reply, Minerva is a project of Facebook server that
> > includes two types of boards. One is the motherboard that includes a BMC
> > and another is the Chassis Management Board that includes a CMC and both
> > use the Aspeed SoC (AST2600). These patches are for the CMC and the link
> > you provided is for the BMC and they need to use different DTS.
>
> Are they similar? Maybe you should share board DTSI?
>
> Best regards,
> Krzysztof
>

No, they are not similar. They just use the same SoC but they are on
different system boards with different electronic schematic.

Thanks,
Yang Chen
