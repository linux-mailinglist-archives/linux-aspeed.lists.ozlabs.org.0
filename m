Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C088B985FA4
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 16:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDJMW6Rjcz2yVt
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 00:02:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727272945;
	cv=none; b=D/LQthE1bXC9FlUAQxaR2R60QKKLRM8sp19YgDgCEZDzULnDTnoF7oBQ30xOn1BIFfGnVRf5cykBzhnYezdPeUhjtUNIi+KEOtOpFZ0gMIi+4DegoZtA+Iw2V/ince7r1odHavnOi86MTZ1vHK36EudUF7pLulccCueFDR34QRK/UCemtaRzyPS9qv17yUbUljkoz+bNTNISBwlV+MV+4G8LYdW8VlYJQTFLvVdrSRLiMb2SQyxyWzN+gWCob0qC+k+RFdRG5w+Ps/5EX55M96pjPMRQ2EGnd0fq1xNNXH8+pFQIBIUhcbLlbvu3Luf/MhGLvmT6cuny7nw4LOFz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727272945; c=relaxed/relaxed;
	bh=ToUKIzEuriYR9o6QD0qmgl4Fmelj6t2JR4wuG3YJ1Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbMgQlVyJWgPcIfeeteR1I72vzuWaC9/1A5r3oS9+moai1JE0geVvt0Obgm+rkmiU7/NvpzCKq6UIFd/YUM+s9FhbbAiV5dA8BU9WxGuxLvYp1px6+lxbqNNdCN+PJGykq5eKFYs3OhjkrUJDcHzNUh6gYZa+o11xqZBGIMWELLeXNyN17aFqX73TrtZ7Du/SU8GORwkBf4Zq2XFXtynwzKumK2o/QdJK0T5/cvggBL9paO1Nq79G0HQZ93qcuSGKPN+L33ZNx8C1fudMTfFYAeeZD0X5jbgq9XWgyaDUgOLdVqdC7z3HVuck/hD2P65SnrzbNSi6mkiV/2fC6FMkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GYrl3EKn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GYrl3EKn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDJMN6CRWz2xjK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 00:02:22 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6db4b602e38so55041487b3.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727272939; x=1727877739; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToUKIzEuriYR9o6QD0qmgl4Fmelj6t2JR4wuG3YJ1Ec=;
        b=GYrl3EKnbQqLmh6k6x1fCHdXivlUfuPFDThF7MIuQlyRg0VwJOEec+2dKMxcNbgpWY
         XFXSo+Rgl+tyR/gLuFJUxD2szjd7qAhTUu+geJ0ZbDQX4r8ENpJSv32zmlRTyc3jAhqf
         9CqWH9zZDhJbKXKdF20Or/RhsISJjwxc8Aj8ThJRb6MaQZi4zszSg1pWi33taqDhOvrO
         q57t6CTcsW4TXwhU8+VshJpG0BN330xcnIosrZnko+dSp7/zBg7aJJfv2kKLavN2PqoF
         g1CwQFDAVA7CJdvO/XHmhgFQ8XfDrbBmnY08Fsa2sTJ3D+L++lz3VdqrYO9M9faAfeC5
         nAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727272939; x=1727877739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToUKIzEuriYR9o6QD0qmgl4Fmelj6t2JR4wuG3YJ1Ec=;
        b=K0sOXFOr1YLj5PsyFlbgrMIHcdgqZ4L1AKfXA/TjIriv1D0XTmcW8UznCcNmPqCS/9
         L/0YpMCJA93ehhPAD/6t+O3NUOCGf1YdeMB49Dn6KusBpk80Lb4UTh1ReMIw0pbceBMs
         X57zyFxCn3ImRfx6XHsOeDRrF0AOb3Yi1N8dA6Ynxu+toK6UsS5GOpUzXYpe85tPV1aG
         eETT82TT6mydLlkhnDgytKf/LrOQRNucNkfvTwoY7+4e4R8I8Jt53DUzZBdolXjAApIv
         aYkiSqv/Kes4Nyt8/WDapGOU5JYSubGW0IK9Ok7/uvIMRzv/Z9Ke3l/LBJKjqVumk5LU
         B/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUKoKwoT+vRI5FeIhiQ/8Dc2lBUUmWg82J23vRdLDjjvDOzkp/ezHOS4k2Hzkcnz3gpjL3b9sI7c+4rug=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7F6MMKokgxS9ah9XKDwd91H5P63Je9TDip6B7Xr2OeJ/79a9F
	5N3jHN0FbEoal8ZEG4rkjSw78tsrnVrJAIAQf623MNedWvaBPFSp49ZrjgEW9L+VbFNwk4D6VXz
	s0nuA+pcbK9gVHfMt3N+gxSJD5IMpgBZpnRmwLg==
X-Google-Smtp-Source: AGHT+IE841pjxIKVha/+JpcEn2ee0Lx4ty464a7C8jVO8vOObnE+8Yr/dOWMzAzJZ++Do5wiVDiWTFPS1iajgW2vevE=
X-Received: by 2002:a05:690c:67c7:b0:6dd:bcfd:f168 with SMTP id
 00721157ae682-6e21d833475mr25994197b3.18.1727272938607; Wed, 25 Sep 2024
 07:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240826081900.2284-1-liulei.rjpt@vivo.com>
In-Reply-To: <20240826081900.2284-1-liulei.rjpt@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Sep 2024 16:01:41 +0200
Message-ID: <CAPDyKFqJAwr7S9nMywnEica77+UeT9pbbcZ05g7+xmT_1Xtd7Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] usb drivers use devm_clk_get_enabled() helpers
To: Lei Liu <liulei.rjpt@vivo.com>
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
Cc: linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com, linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Daire McNamara <daire.mcnamara@microchip.com>, Neal Liu <neal_liu@aspeedtech.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Bin Liu <b-liu@ti.com>, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 26 Aug 2024 at 10:19, Lei Liu <liulei.rjpt@vivo.com> wrote:
>
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids calls to clk_disable_unprepare().

As I stated on another thread too [1], using devm_clk_get_enabled()
isn't solely a nice cleanup of the code. It may actually introduce a
change in behaviour. Therefore, I would not recommend applying that
kind of changes, unless some of the maintainers acks it or it gets
tested on real HW.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20240827074857.2671808-1-xirui.zhang@vivo.com/

>
> ---
> version 3 changes
> Fix the email thread.
>
> ---
> version 2 changes
>
> The files ux500.c, mpfs.c, and pxa27x_udc.c have incorrect usage of
> certain interfaces due to the lack of synchronization during the
> commit updates. These issues have been corrected in the v1 version.
>
> 1.ux500: Incorrect usage of clk_prepare_enable() should be corrected to
>   devm_clk_get_enabled().
> 2.mpfs: Incorrect usage of devm_clk_get_enable() should be corrected to
>   devm_clk_get_enabled().
> 3.pxa27x_udc: Incorrect usage of clk_prepare_enable() should be
>   corrected to devm_clk_get_enabled().
>
> Lei Liu (5):
>   usb: aspeed_udc: Use devm_clk_get_enabled() helpers
>   usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
>   usb: r8a66597-udc: Use devm_clk_get_enabled() helpers
>   usb: mpfs: Use devm_clk_get_enabled() helpers
>   sb: ux500: Use devm_clk_get_enabled() helpers
>
>  drivers/usb/gadget/udc/aspeed_udc.c   |  9 +--------
>  drivers/usb/gadget/udc/pxa27x_udc.c   |  6 +-----
>  drivers/usb/gadget/udc/r8a66597-udc.c | 16 ++++------------
>  drivers/usb/musb/mpfs.c               | 22 ++++++----------------
>  drivers/usb/musb/ux500.c              | 18 ++++--------------
>  5 files changed, 16 insertions(+), 55 deletions(-)
>
> --
> 2.34.1
>
>
