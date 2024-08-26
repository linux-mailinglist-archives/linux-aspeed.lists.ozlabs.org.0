Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAEE95EF51
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 13:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsnnz0rgyz2yky
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 21:02:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724670164;
	cv=none; b=YKCS2MZ8g9N2JVYRyZ7oEJ/NHJu/Hx7CZ6Syijh0keKbJN/KUmWTznqOkOoh5w0EW/IZFikGQsl8lRHwsGLRuPvbZZxZG1Haj2wWkOOuSStNuSeTz+3gtaDJR26plq+t+u5jrtg8f0XaebdWItKIDoxHWbGAXHk05FkFN9qR1Nf9g/2C2z+leLgPs4qPY5kbm6DjF1+gFkUuvgL7+hQvq5XA39GgGElZ8SZ1BsQ84hHU8gXgp2IQ/7Se2105CvQsm3i44WW5H1+ogENy/s44yqGd2eGayR/cb1Q5YMbAvaE2V7W/5r40EXXG0jmEhFfADYPd6KdN1sS4ztkRey1aTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724670164; c=relaxed/relaxed;
	bh=xil6lnVYUEIqTfiiA5wBkozdOtnz6IoK/KV8LMP4ZFY=;
	h=X-Greylist:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport; b=ITW5s7r/rvtZ1YeoVILO2mkUim4SpJaeQcWAU/FiFbreD5p6RCcOi/MO70g3YPNCaw+PsHapYdYLI7/5cov4Hz9mWV4aq0GrhZ6uZ7569wOJSn9HD0XKp8esNSMdvWmC2R01tmovyUfzTcQ9rlf63wXdnFv58gR9SFlgelEIZxq5kfEUAnHoVtd8/B9yhfciPY6YyNriiVhSmmqGvDrYjQrRckJ61NMG9L9Geu8+nNWcejPj48qen0cJ1zhGcSNBfnGiEDgQeVrE3KU81eqX3N5YidYqgpxKvdRmw1JviHE3dzM4uYZEw1tULsu7HTx0FL7ZrAN5a13mTETird6QfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VprpUSET; dkim-atps=neutral; spf=pass (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VprpUSET;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Mon, 26 Aug 2024 21:02:42 AEST
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsnnt0YTdz2yN1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 21:02:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724670152; x=1725274952; i=markus.elfring@web.de;
	bh=xil6lnVYUEIqTfiiA5wBkozdOtnz6IoK/KV8LMP4ZFY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VprpUSETF75bOdBzzFvfxWciLcgKv/tw9LRY6TcfMcBKIRRAh/367M1LjHQp/cNa
	 mwhbO08/xVMHEKso/m4B93pgjbwnleTN2GThoa6bqDT2Be6JT6mAOAd82p97IPVOq
	 MJYzJJHNlpUABprqCj2by/xp8hTmip/RqMBUhbyxRITG5AVKvCiictwGmJI6uqlx3
	 7H1MCGWdDByZmyduNZOkJUQr7CONSH16dmZrjzZsvIKzAWRLym+LWHXx+0hOuXkkT
	 zcd2cE6XO3jF+COiddCCfrf60WDS/gB6JXrrUC/8pqUwDtjQop0JaT++OHfoNEjBl
	 hoKXQItbge6CGwvSXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTfkf-1sWfHq1zMj-00UODV; Mon, 26
 Aug 2024 12:56:27 +0200
Message-ID: <42c569f4-9171-46e0-9df3-72c583106cc4@web.de>
Date: Mon, 26 Aug 2024 12:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Billy Tsai <billy_tsai@aspeedtech.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
References: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 2/2] gpio: Add G7 Aspeed gpio controller driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2ek2bR01HsFIz987VGqUZM83F9xykdulPeTU9R4bJ/Qcy8kSImn
 37EMNlb8QmaQC+P0zBrv8F0DISDkjFyCP/upaMf+zUj09yHC/ZG6pVzen3Tz6B6oFLsn1xn
 MYslybCraX1+4TIqfuU7UWVTh8gAZDiwrKXDwu9WaihYUdTcEi5v8nPIxbT+M8lXXqmf6G8
 1eL1qWm/M6m13Wdfx1s2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VcM935hNhIQ=;Fh757RJMi0Km6bNmj1Ji5rzvcdm
 d05PzQViscAIvpZ4xLlM6ehVKDfd+jbGMb4PK/8dkiL4Z4uRH1aQV3Z9+fy+d8EARp1EpSPEV
 xKgCD12aYCPNmz4kJP8AC53Q4BvhrWEK3spm9E7Eziakvk1WFFLAPk8oqfIj8ldoQrRccL8/6
 1MtTeqFb8b1425OpZrHL1qwZXbR633AddM/ZAbs/fiyrk1GyAimZRR/dbu1v5uaJa2YMV1m2v
 LFJk1Quw6Sbjqawk8poYg0xE13jVR31y+3v5pE2vxQhlEMnHBb/R7Nd/jg20MSPcgQA5Hv3OL
 KTf0yRSW4f8ZqYOEE5zcZiolKCl6lDQm8BjWo4nIcOdOEDK+l4sHhD+LelESer1Kaxht0ViYB
 lDw6nxVEmfL7dejqfUSri5EKlz3+Lb992ETQuTaPQFcsTVRHvz5XMbB2VK0CD2o/tASgU05xP
 oGaVTxsEpLg4hLCpcbzcPYzA+kcyjmRhervTGhF4vak+Q5srE3kXi4axBvHY1eLfSudfTdXRm
 d5lzK4IGZQmAAF7hTrzgKBRS1yL8rFRjEUYVebLv8QwRNE552PdWRSJ6U26xrNfBEWvfih3i6
 Ccd0Q/6xChvKgUNxwLj3QxxOlVp2s2j4GqnUYOFm4+wTBlcNbohGpM9SX08YDEqsczn8tkVMw
 5wBHZcnIegFeZ0ewp3pTqu0koXk+NOC4GCYtBZ8ljltZsWzStVUAbmZhml+27LQ35nJL09gg+
 Vcp9Gpu9/d6FK/z6EfDtpVwWBeTl8Yh4ZDG1vtu5BFnkl0azR1+p00kL9MP5eCKbd82k2VP4a
 uPlnkcdfFXQ5BHjpx0uN6z1w==
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> +++ b/drivers/gpio/gpio-aspeed-g7.c
> @@ -0,0 +1,831 @@
=E2=80=A6
> +static void aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int offse=
t, int val)
> +{
=E2=80=A6
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	__aspeed_gpio_g7_set(gc, offset, val);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(raw_spinlock_irqsave)(&gpio->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc5/source/include/linux/spinlock.h=
#L551

Regards,
Markus
