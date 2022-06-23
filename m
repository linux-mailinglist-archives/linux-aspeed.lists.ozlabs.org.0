Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF42557296
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 07:34:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT88S3DmFz3bth
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 15:34:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nMxRlStS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nMxRlStS;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT88M4vJwz3bln
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 15:34:42 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id z9so10351134wmf.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 22:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B8cxDTttGuvM5WfX5frYexXa0T6hUzSm4PgtcOxFD6s=;
        b=nMxRlStSEh8OiHmbIP+I1FAfjgkYRbF158GwowQoYBAgp1Ry5ceVQzXvYyhPfQsW8w
         BmPMo13r28aDqxZZT+jWMnoG5WGNuauGXl/TvnXVkCr381COm6zJO2b4PijkUFBJrDow
         WN66EZCBeYlgzROXe2+KQjtXqKnUO892AETRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B8cxDTttGuvM5WfX5frYexXa0T6hUzSm4PgtcOxFD6s=;
        b=7iOExwcKZ2LLSCJrAT7tHtLfGdTv1uZRlrm6VIWz85gsAFTtHn+1VG4ODz/THMRvps
         zpw6+w8KuqHe/G84pocbzqF6WMYA/PNWbTvumSkfmths667WIsufsKDjylbufOSgK1p4
         CviihQQ+uTJOfedd1eOJ3A4xgPYUOPjGLVUZfgNEf7ouSlS6UYLsu5E9cIo1K0JLm9fq
         1zTRuhZ4mwAv95iK1MYUBbld9qQqEY795Z8Ozmj/TBfUq5aeOyQmuiYKRKB48OMjRTK3
         y9/luTee+WYlhtBozO39h8hzBvv9cF/QgVMN3sYj/uaijJYEyxIDdK1pJY5NHAQVtE+U
         Gesg==
X-Gm-Message-State: AJIora/qAgxCwX3pOwbKcMXI9ZlgL/nRpoWPDdH5dWA769ouhMbsdxEG
	DycaqWdTRqZ1cdi6lXNvUI2FauqpZgHlJR4CnT8=
X-Google-Smtp-Source: AGRyM1tXegIUiy0sBBYZdYNPa6XJdexkZiJZp4a8S0xAChirQ3IDFRLYnIeC5JTovAQeot2wwJ3SQBXgnb4ABFJefv0=
X-Received: by 2002:a05:600c:1990:b0:39c:81f0:a882 with SMTP id
 t16-20020a05600c199000b0039c81f0a882mr1950976wmq.72.1655962478517; Wed, 22
 Jun 2022 22:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-7-krzysztof.kozlowski@linaro.org> <165589305701.29629.10216921074802952879.b4-ty@linaro.org>
In-Reply-To: <165589305701.29629.10216921074802952879.b4-ty@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:34:26 +0000
Message-ID: <CACPK8XfxXi8kQr+vxta8rD6SBgxLf_oBjAH0UkPBacQta552YQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 7/7] ARM: dts: aspeed: centriq2400: use qcom compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ken Chen <chen.kenyy@inventec.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 22 Jun 2022 at 10:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On Sun, 29 May 2022 12:49:28 +0200, Krzysztof Kozlowski wrote:
> > "qualcomm" is not a documented compatible and instead "qcom" should be
> > used.
> >
> >
>
> Applied, thanks!

What tree did you apply this to? Did you get review from the maintainer?

This board is unmaintained and unused. I would prefer it removed
rather than meaningless fixes be applied.

>
> [7/7] ARM: dts: aspeed: centriq2400: use qcom compatible
>       https://git.kernel.org/krzk/linux/c/6202c6063145cf9ec22b40aac219122dd702a10f
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
