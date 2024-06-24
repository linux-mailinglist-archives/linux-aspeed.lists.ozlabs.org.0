Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE39579C2
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKT0FNfz7C9s
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iH7EIbAu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=noname.nuno@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W714l12Bnz30W7
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 18:16:06 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so23040895e9.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719216964; x=1719821764; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=anUx2BNECsYVyVyl4y4fqgu2nK2IHw6PKDfw8bAQCPM=;
        b=iH7EIbAuCF3qeDGcVbYgcPVsfnxktT4ykl+FYyfg3R/AONiXTS5IKVTqNefhHcyTn4
         hGiWhgGmgy/3fEpRXCDkUXQMIJPUJ2C5QINVzAO+yWa0Brgn4uXUfD2Tn371NDcaLMYb
         vdxCEDr8OGxvgU5o0hPFSyaEpDqVgQ/kaNCUp/VkDI6AodYB3esqDDLkz3RdW2BeHx+n
         5u6K4oFpyEWfePH5hqFv+sgldXffRJDvAo9fIgrMfFeO8ZtbFQE8SGH3jDjNWK6Tt5SJ
         HiUQpBmUhzOflieZqxQgyW0vDKS+iCN3qGnoP8tucmZOzC6UDxiTxdLIuMm5s2f4SSoF
         c5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216964; x=1719821764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=anUx2BNECsYVyVyl4y4fqgu2nK2IHw6PKDfw8bAQCPM=;
        b=ClawZttAPTsGl7vjMXSZEZSlqs8/M0wPbc3QkDem8nfxc/OZOF1STcVhwruskPm5wC
         YWw7J1tfufq3i6f7GQODmU+l5BrWm8RJ8zFeAA17DRJ9D/73ALO6Y3iyKPHvpfB/YFKW
         mwOZg9TkKLO3IpsS684qr0jDBCTcSJ0ESkyLHhX2H1zjMdlRr2J52NDPReGADWcfemIo
         M3WMZpX/lglGkWzKmgcdvdKiRx86WJ7ycuGxcJz5mZwW0IReev8tbl+OA/9LP94JZEmL
         pki8hsCJ4uVyf8H7PtSOxIUPEgCPZ/YKWgEL0Myeb1iPo1OML3QyqHMv4b6Yw4TjCIy7
         s/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW1Nel8fi4gbeQGpEz2JYFCygbgIP9nJLQzSvd53splVmcbTWcU7ACdR/ozZbaAao7E6RsR4ld9cD9R5kyd0NGtKLcpp91Oa22VOKxdig==
X-Gm-Message-State: AOJu0YwTPGAI3WuNvS56q5gBzUBUsrIbJ1nU0l9NYmMzRE3ywV8XXlkk
	VI4b3AzCeVnqLrY9VSJ/7jnObtQBw2kIRKslfNuLfzGnQV46MUaN
X-Google-Smtp-Source: AGHT+IEg4YEeXdX4d32s4QZLDhL03W5e0Fpi3DQU+njzoWulsVPC6CqcL8hsNWTIkX1QTrnextuZ0w==
X-Received: by 2002:a05:600c:35c6:b0:421:b65d:2235 with SMTP id 5b1f17b1804b1-424895707c9mr48014095e9.0.1719216963902;
        Mon, 24 Jun 2024 01:16:03 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663ada0f8csm9279434f8f.115.2024.06.24.01.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:16:03 -0700 (PDT)
Message-ID: <ae9ba7ceab932277703c048d80b49af4cfff439b.camel@gmail.com>
Subject: Re: [PATCH 06/10] iio: adc: max1363: use
 devm_regulator_get_enable_read_voltage()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>
Date: Mon, 24 Jun 2024 10:16:03 +0200
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-6-49e50cd0b99a@baylibre.com>
References: 	<20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
	 <20240621-iio-regulator-refactor-round-2-v1-6-49e50cd0b99a@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, Andreas Klinger <ak@it-klinger.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-21 at 17:11 -0500, David Lechner wrote:
> Use devm_regulator_get_enable_read_voltage() to simplify the code.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>


