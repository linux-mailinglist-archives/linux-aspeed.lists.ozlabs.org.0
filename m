Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D8504A0F
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Apr 2022 01:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhR8W0fJtz2yw9
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Apr 2022 09:28:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZUEVumam;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112a;
 helo=mail-yw1-x112a.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZUEVumam; dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhR8Q4KD9z2xX6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Apr 2022 09:28:35 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ec0bb4b715so126358047b3.5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 17 Apr 2022 16:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1/D8jakBK7mlAzFfYLKn6PUTb5ZTxAVFz+784pXTduI=;
 b=ZUEVumam4891Xs202SHodTKlMQDOUzkRkVxJxgpFYPz0GM8YjSJ2lwvJtMFmvHGzVm
 Wn+Z2yCCjvvp4+9/qgZS3fzcwTpqGqHbQ/Z/qk22hJVqBP6NrpMvh6nbo7Tt6Cs8ccVS
 OUVzTpSeATeeJ0jjbfBdCO0EqpY0hc1HKFAPE4Yxb85H0JTb0Te96EDUFnvRby9yE6Uj
 A76eqWB1j0Z15SkgJY254zbmdwDJ+Ko6yGf52pgtvPuTEUog4XSZcsbzhO16JQ0j8N+U
 kYqFJbEQUBw8Wc7QQ11gUPmkcKChz69LCrYvyEar+J1AskSD2rgo+b1lqIvWveYDtbKf
 LIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/D8jakBK7mlAzFfYLKn6PUTb5ZTxAVFz+784pXTduI=;
 b=PUXD0e9ySZydemol0Ng/pEgTgihTTdrQSuyLoR2+nQdmMj1224pIDZRXGN3J6uaPHq
 fc+o1/q+NGpLmuBHrxKggn+8YuoHk0/bggdpTSIrl8XUcAaccl9sAKyLOOzeU++kjn7m
 ss1gj6XLxjCsNOqHcZwcH+ZOsYf/IxPgi1CcXgRPUnLgMJB0NkWaeExEwEbnyLgjRnFh
 6Z3ZeRRn7UCv94Yy0DjV9k4OgZ0wAUNrnQQ5Lr9TEuywPdQTkB6ONq5g90gAmi50USrG
 ATZiqv1J8WMnHmWCI4s2BcSD5NloOcvjE+Z5eRlxWTxnNs9HidbZnSF5iYCLF7GWMOYF
 Rtcg==
X-Gm-Message-State: AOAM5311p3PyNGHMAt4sQiPgj7AEQ93pQvOrkgKdBZKO7YEhFTN2+GL0
 ZMJnIyIO9sDRUFiRPhuiaAhUJUp3FdZoXMcWDQ77FA==
X-Google-Smtp-Source: ABdhPJxwyR2gYeQVglMPTleaOZlXGb6s8hwJ1cpMSLXXOlOQM9EgI4BGrJF2ZF0w6azONbdN1H7VXGJpUPxJuJu+6+g=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr8611690ywh.140.1650238109938; Sun, 17
 Apr 2022 16:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Apr 2022 01:28:18 +0200
Message-ID: <CACRpkdZff-TbnNHO6Q590ubyH51+yqN68DOghazVKvYoHMBekw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Fix AST2600 quad mode SPI pinmux settings
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Jamie Iles <quic_jiles@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Jae,

On Tue, Mar 29, 2022 at 7:40 PM Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:

> Jae Hyun Yoo (5):
>   pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
>   dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
>   dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
>   pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group

These four patches applied to the pinctrl tree.

Please funnel patches 1, 6, 7 through the SoC tree.

Yours,
Linus Walleij
